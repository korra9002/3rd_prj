package kr.co.prj.controller;

import java.security.NoSuchAlgorithmException;
import java.util.Calendar;

import kr.co.prj.vo.DiaryResultVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class Test {

	public static void main(String[] args) {
			try {
			System.out.println(DataEncrypt.messageDigest("md5", "1234"));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			DiaryResultVO[] drArr = null;
			drArr = new DiaryResultVO[4];
			drArr[1]= new DiaryResultVO("asda", "asdsad", 12);
			for (int i = 0; i < drArr.length; i++) {
				System.out.println(drArr[i]);
				
			}
			String cvv = "12/23";
			System.out.println(cvv.indexOf("/")==2)
			;
			
			int year1 = Calendar.getInstance().get(Calendar.YEAR);
			int month1 = Calendar.getInstance().get(Calendar.MONTH);
			int day1 = Calendar.getInstance().get(Calendar.DATE);
			
			System.out.println(year1+"/"+month1+day1);
	}

}
