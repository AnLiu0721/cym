package com.utils;
import java.text.SimpleDateFormat;
import java.util.Date;
public class OrderNumber extends Thread {

	private static String date;
	private static Long on =00l;
	public static String getOrderNo() {
		synchronized (OrderNumber.class){
			String str = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //当前时间
			if (date == null || !date.equals(str)) { //判断
				date = str;
				on = 00l; //（这里是l）不是数字的1，因为是long类型
			}
			on++;
			System.out.println(on+"\n");
			long orderNo = Long.parseLong(date)*100; //将字符串转化为Long类型
			orderNo += on;  //订单其实号
			return "cym" + orderNo; //拼接订单号
		}

	}
	public static void main(String[] args) throws InterruptedException {
		for(int i=0;i<10;i++){
			System.out.println(OrderNumber.getOrderNo());//Thread.sleep(2000);
		}
	}


}

	

