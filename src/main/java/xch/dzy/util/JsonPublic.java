package xch.dzy.util;

import org.springframework.stereotype.Component;

/**
 * Created by acy on 2017/6/5.
 */
@Component
public class JsonPublic {

    private int code;

    private Object object;

    private String message;

    public JsonPublic(){}

    public JsonPublic(int code, String message, Object object) {
        this.code = code;
        this.object = object;
        this.message = message;
    }
    public JsonPublic(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "JsonPublic{" +
                "code=" + code +
                ", object=" + object +
                ", message='" + message + '\'' +
                '}';
    }
}
