package xch.dzy.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xch.dzy.dao.SystemDao;
import xch.dzy.dao.UserPhoneLogDao;
import xch.dzy.model.UserPhoneLog;
import xch.dzy.util.YXDate;

@Service
public class SystemService {
	
	@Autowired
	private UserPhoneLogDao userPhoneLogDao;
	
	@Autowired
	private SystemDao systemDao;
	
	/**
	 * 发送短信，处理返回码，判读是否成功
	 * 
	 * @param config
	 *            //发送是需要的参数（map）
	 * @param submitUrl
	 *            //发送地址
	 * @return map key: status Faild 失败 Success 成功 msg 提示信息
	 */
	public Map<String, String> sendSMS(Map<String, String> config,
			String submitUrl, String type, int userId) {
		Map<String, String> resultMap = new HashMap<String, String>();
		String result = "";
        BufferedReader in = null;
		try {
			// 判断网站是否开启了发送短信的开关con_SMS_send
			String openSendMsg = systemDao.findValueByNid("con_SMS_send");
			if (openSendMsg.equals("1")) {
				String content = URLEncoder.encode(config.get("content"), "UTF-8");
				String urlName = config.get("url")+"?username="+config.get("username")+"&password="+config.get("password")+"&mobile="+config.get("mobile")
				+"&content="+content+"&productid="+config.get("productid")+"&xh="+config.get("xh")+"&dstime="+config.get("sendTime");
				System.out.println("param:"+urlName);
				URL realUrl = new URL(urlName);
				// 打开和URL之间的连接
				URLConnection connection = realUrl.openConnection();
				// 设置通用的请求属性
				connection.setRequestProperty("accept", "*/*");
				connection.setRequestProperty("connection", "Keep-Alive");
				connection.setRequestProperty("user-agent",
						"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
				// 建立实际的连接
				connection.connect();
				in = new BufferedReader(new InputStreamReader(
	                    connection.getInputStream()));
	            String line;
	            while ((line = in.readLine()) != null) {
	                result += line;
	            }
	            String reString = result.substring(0, 1);
				if(Double.parseDouble(reString)>0){
					
					UserPhoneLog userPhoneLog = new UserPhoneLog();
					userPhoneLog.setAction(type);
					userPhoneLog.setPhone_number(config.get("mobile"));
					userPhoneLog.setPhone_log(config.get("text"));
					userPhoneLog.setTime(YXDate.getTime());
					if (userId != 0) {
						userPhoneLog.setUid(userId);
					}
					userPhoneLogDao.insert(userPhoneLog);
					resultMap.put("status", "Success");
					resultMap.put("msg", "短信发送成功！");
				}
			} else {
				resultMap.put("status", "Faild");
				resultMap.put("msg", "管理员关闭了短信发送功能！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", "Faild");
			resultMap.put("msg", "短信发送时发生了未知的错误！");
		}
		return resultMap;
	}
	
	public String findValueByNid(String nid) {
		
		return systemDao.findValueByNid(nid);
	}

}
