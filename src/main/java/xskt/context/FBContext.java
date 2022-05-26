package xskt.context;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class FBContext {
	private String FACEBOOK_APP_ID = "1928046040711654";
	private String FACEBOOK_APP_SECRET = "f69dc787aa08d091eadec4e3d87f536c";
	private String FACEBOOK_REDIRECT_URL = "http://xskt.ddns.net:8080/xskt/LoginWithFB";
	private String accessToken = "";

	public String getFBAuthUrl() {
		String fbLoginUrl = "";
		try {
			fbLoginUrl = "http://www.facebook.com/v13.0/dialog/oauth?" + "client_id="
					+ FACEBOOK_APP_ID + "&redirect_uri="
					+ URLEncoder.encode(FACEBOOK_REDIRECT_URL, "UTF-8")
					+ "&state=email";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fbLoginUrl;
	}

	public String getFBGraphUrl(String code) {
		String fbGraphUrl = "";
		try {
			fbGraphUrl = "https://graph.facebook.com/v13.0/oauth/access_token?"
					+ "client_id=" + FACEBOOK_APP_ID + "&redirect_uri="
					+ URLEncoder.encode(FACEBOOK_REDIRECT_URL, "UTF-8")
					+ "&client_secret=" + FACEBOOK_APP_SECRET + "&code=" + code;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fbGraphUrl;
	}

	public String getAccessToken(String code) {
		if ("".equals(accessToken)) {
			URL fbGraphURL; //creating a url object
			try {
				fbGraphURL = new URL(getFBGraphUrl(code));
			} catch (MalformedURLException e) {
				e.printStackTrace();
				throw new RuntimeException("Invalid code received " + e);
			}
			URLConnection fbConnection;// creating a urlconnection object
			StringBuilder b = null;
			try {
				fbConnection = fbGraphURL.openConnection();
				 // wrapping the urlconnection in a bufferedreader  
				BufferedReader in;
				in = new BufferedReader(new InputStreamReader(
						fbConnection.getInputStream()));
				
				String inputLine;
				b = new StringBuilder();
				// reading from the urlconnection using the bufferedreader  
				while ((inputLine = in.readLine()) != null) {
					b.append(inputLine + "\n");
				}
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("Unable to connect with Facebook "
						+ e);
			}

			accessToken = b.toString();
			if (accessToken.startsWith("{")) {
				throw new RuntimeException("ERROR: Access Token Invalid: "
						+ accessToken);
			}
		}
		return accessToken;
	}
}
