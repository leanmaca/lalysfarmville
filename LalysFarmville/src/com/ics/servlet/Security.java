package com.ics.servlet;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class Security {
	private static byte[] key = { 0x4c, 0x65, 0x61, 0x6e, 0x64, 0x72, 0x69, 0x6e, 0x20, 0x4d, 0x61, 0x63, 0x61, 0x6c,
			0x69, 0x6e};

	public static String encrypt(String strToEncrypt) {
		String encryptedString = null;

		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
			final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			encryptedString = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes()));
		} catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}

		return encryptedString;
	}

	public static String decrypt(String codeDecrypt) {
		String decryptedString = null;

		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
			final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);

			decryptedString = new String(cipher.doFinal(Base64.decodeBase64(codeDecrypt)));
		} catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}

		return decryptedString;
	}
}
