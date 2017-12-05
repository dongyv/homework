package xch.dzy.controller;

public class demo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] shop_list = {1,2,2,3,3,3,3,3,4};
		int num = 0;
		for(int i=0;i<shop_list.length;i++) {
			num++;
			if(i+1==shop_list.length) {
				break;
			}
			if(shop_list[i]==shop_list[i+1]) {
				num--;
			}
		}
		System.out.println(num);
	}

}
