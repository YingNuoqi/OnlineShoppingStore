package com.ynq.util;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class PaymentUtil {
	
private static String encodingCharset = "UTF-8";
	
	/**
	 * yeepay
	 * generate the method of hmac
	 * 
	 * @param p0_Cmd: business type
	 * @param p1_MerId: merchant id
	 * @param p2_Order: merchant order number
	 * @param p3_Amt: payment amount
	 * @param p4_Cur: transaction currency
	 * @param p5_Pid: product name
	 * @param p6_Pcat: product type
	 * @param p7_Pdesc : product description
	 * @param p8_Url: The url at which the merchant receives payment success data
	 * @param p9_SAF: shipping address
	 * @param pa_MP: merchant extended info
	 * @param pd_FrpId: bank id
	 * @param pr_NeedResponse : response mechanism
	 * @param keyValue : merchant secret key
	 * @return
	 */
	public static String buildHmac(String p0_Cmd,String p1_MerId,
			String p2_Order, String p3_Amt, String p4_Cur,String p5_Pid, String p6_Pcat,
			String p7_Pdesc,String p8_Url, String p9_SAF,String pa_MP,String pd_FrpId,
			String pr_NeedResponse,String keyValue) {
		StringBuilder sValue = new StringBuilder();
		sValue.append(p0_Cmd);
		sValue.append(p1_MerId);
		sValue.append(p2_Order);
		sValue.append(p3_Amt);
		sValue.append(p4_Cur);
		sValue.append(p5_Pid);
		sValue.append(p6_Pcat);
		sValue.append(p7_Pdesc);
		sValue.append(p8_Url);
		sValue.append(p9_SAF);
		sValue.append(pa_MP);
		sValue.append(pd_FrpId);
		sValue.append(pr_NeedResponse);
		
		return PaymentUtil.hmacSign(sValue.toString(), keyValue);
	}
	
	/**
	 * 
	 * 
	 * @param hmac: Cryptographic captcha sent from the payment gateway
	 * @param p1_MerId: merchant code
	 * @param r0_Cmd: business type
	 * @param r1_Code: payment result
	 * @param r2_TrxId: yeepay Payment transaction serial number
	 * @param r3_Amt: payment amount
	 * @param r4_Cur: transaction currency
	 * @param r5_Pid: product name
	 * @param r6_Order: merchant order number
	 * @param r7_Uid: yeepay membership id
	 * @param r8_MP: merchant extended info
	 * @param r9_BType: transaction result type
	 * @param keyValue: secret key
	 * @return
	 */
	public static boolean verifyCallback(String hmac, String p1_MerId,
			String r0_Cmd, String r1_Code, String r2_TrxId, String r3_Amt,
			String r4_Cur, String r5_Pid, String r6_Order, String r7_Uid,
			String r8_MP, String r9_BType, String keyValue) {
		StringBuilder sValue = new StringBuilder();
		sValue.append(p1_MerId);
		sValue.append(r0_Cmd);
		sValue.append(r1_Code);
		sValue.append(r2_TrxId);
		sValue.append(r3_Amt);
		sValue.append(r4_Cur);
		sValue.append(r5_Pid);
		sValue.append(r6_Order);
		sValue.append(r7_Uid);
		sValue.append(r8_MP);
		sValue.append(r9_BType);
		String sNewString = PaymentUtil.hmacSign(sValue.toString(), keyValue);
		return sNewString.equals(hmac);
	}
	
	/**
	 * @param aValue
	 * @param aKey
	 * @return
	 */
	public static String hmacSign(String aValue, String aKey) {
		byte k_ipad[] = new byte[64];
		byte k_opad[] = new byte[64];
		byte keyb[];
		byte value[];
		try {
			keyb = aKey.getBytes(encodingCharset);
			value = aValue.getBytes(encodingCharset);
		} catch (UnsupportedEncodingException e) {
			keyb = aKey.getBytes();
			value = aValue.getBytes();
		}

		Arrays.fill(k_ipad, keyb.length, 64, (byte) 54);
		Arrays.fill(k_opad, keyb.length, 64, (byte) 92);
		for (int i = 0; i < keyb.length; i++) {
			k_ipad[i] = (byte) (keyb[i] ^ 0x36);
			k_opad[i] = (byte) (keyb[i] ^ 0x5c);
		}

		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {

			return null;
		}
		md.update(k_ipad);
		md.update(value);
		byte dg[] = md.digest();
		md.reset();
		md.update(k_opad);
		md.update(dg, 0, 16);
		dg = md.digest();
		return toHex(dg);
	}

	public static String toHex(byte input[]) {
		if (input == null)
			return null;
		StringBuffer output = new StringBuffer(input.length * 2);
		for (int i = 0; i < input.length; i++) {
			int current = input[i] & 0xff;
			if (current < 16)
				output.append("0");
			output.append(Integer.toString(current, 16));
		}

		return output.toString();
	}

	/**
	 * 
	 * @param args
	 * @param key
	 * @return
	 */
	public static String getHmac(String[] args, String key) {
		if (args == null || args.length == 0) {
			return (null);
		}
		StringBuffer str = new StringBuffer();
		for (int i = 0; i < args.length; i++) {
			str.append(args[i]);
		}
		return (hmacSign(str.toString(), key));
	}

	/**
	 * @param aValue
	 * @return
	 */
	public static String digest(String aValue) {
		aValue = aValue.trim();
		byte value[];
		try {
			value = aValue.getBytes(encodingCharset);
		} catch (UnsupportedEncodingException e) {
			value = aValue.getBytes();
		}
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return toHex(md.digest(value));

	}

}