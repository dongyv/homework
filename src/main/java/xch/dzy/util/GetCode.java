package xch.dzy.util;

import java.util.Random;

public class GetCode {
	public static String getFixLenthString(int length) {
		Random rm = new Random();
		//��������
		double pross = rm.nextDouble();
		
		String lengthString = String.valueOf(pross);
		
		
		return lengthString.substring(2,length+2);
	}
}
