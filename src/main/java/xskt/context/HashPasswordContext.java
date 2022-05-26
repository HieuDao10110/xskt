package xskt.context;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.HexFormat;
import java.util.Random;

public class HashPasswordContext {
	public String getSecurePassword(String password, byte[] salt) {

	    String generatedPassword = null;
	    try {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(salt);
	        byte[] bytes = md.digest(password.getBytes());
	        StringBuilder sb = new StringBuilder();
	        //convert byte arr to String of hex
	        for (int i = 0; i < bytes.length; i++) {
//	        	Flag '0' - The result will be zero-padded (them 0 vao truoc neu it hon 2 so)
//	        	Width 2 (lay toi thieu 2 so)(o day 1byte toi da co 2 so trong hex: ff)
//	        	Conversion 'X' - The result is formatted as a hexadecimal integer, uppercase
	        	sb.append(String.format("%02X", bytes[i]));	            
	        }
	        generatedPassword = sb.toString();
	    } catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	    }
	    return generatedPassword;
	} 
	
	// create salt with 16 byte
	public byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }
    
	public String saltToString(byte[] salt) {
    	String str = null;
    	StringBuilder sb = new StringBuilder();
    	for (int i = 0; i < salt.length; i++) {
        	sb.append(String.format("%02X", salt[i]));	            
        }
    	str = sb.toString();
    	return str;
    }
	
	public byte[] saltToByteArr(String salt) {
		byte [] arr = new byte[16];
    	arr = HexFormat.of().parseHex(salt);
    	return arr;
    }
	
	public String generatePassword(int length) {
		String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
	    String specialCharacters = "@#$%^&+=.\\-_*";
	    String numbers = "1234567890";
	    String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
	    Random random = new Random();
	    char[] passArr = new char[length];

	    passArr[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
	    passArr[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
	    passArr[2] = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
	    passArr[3] = numbers.charAt(random.nextInt(numbers.length()));
	   
	    for(int i = 4; i< length ; i++) {
	    	passArr[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
	    }
	    String password = String.valueOf(passArr);
	    return password;
	}
//    public static void main(String[] args) throws NoSuchAlgorithmException {
//
//    	HashPasswordContext a = new HashPasswordContext();
//        // same salt should be passed
//        byte[] salt = a.getSalt();
//        String password1 = a.getSecurePassword("Hieu@123", salt);
//        String saltString = a.saltToString(salt);
//        System.out.println(" Password -> " + password1);
//        System.out.println(" Salt -> " + saltString);
//        Password -> 7FAEC6AB9F2A5B266C3443D2DA72A1F67F7756737F069FB6F8BCF977CABA3E30
//        Salt -> E61563849BB6062C9112162F4CBE8489
//    }
}
