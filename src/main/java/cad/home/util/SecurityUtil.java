package cad.home.util;

import java.security.MessageDigest;

public class SecurityUtil {
    
	// 비밀번호를 넣으면 암호화된 문자열을 리턴하는 함수
    public static String encryptSHA256(String str) {
        String sha = "";
        try {
            MessageDigest sh = MessageDigest.getInstance("SHA-256");
            sh.update(str.getBytes());
            byte byteData[] = sh.digest();
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            sha = sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
            sha = null;
        }
        return sha;
    }
}