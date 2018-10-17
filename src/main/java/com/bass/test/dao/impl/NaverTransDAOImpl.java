package com.bass.test.dao.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.bass.test.dao.NaverTransDAO;

public class NaverTransDAOImpl implements NaverTransDAO {
	private String clientId;
	private String clientSecret;
	private String clientIdAdd;
	private String clientSecretAdd;
	private String apiURL;
	private String source;
	private String target;

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientSecret() {
		return clientSecret;
	}

	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}

	public String getClientIdAdd() {
		return clientIdAdd;
	}

	public void setClientIdAdd(String clientIdAdd) {
		this.clientIdAdd = clientIdAdd;
	}

	public String getClientSecretAdd() {
		return clientSecretAdd;
	}

	public void setClientSecretAdd(String clientSecretAdd) {
		this.clientSecretAdd = clientSecretAdd;
	}

	public String getApiURL() {
		return apiURL;
	}

	public void setApiURL(String apiURL) {
		this.apiURL = apiURL;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	@Override
	public String toString() {
		return "NaverTransDAOImpl [clientId=" + clientId + ", clientSecret=" + clientSecret + ", clientIdAdd="
				+ clientIdAdd + ", clientSecretAdd=" + clientSecretAdd + ", apiURL=" + apiURL + ", source=" + source
				+ ", target=" + target + "]";
	}

	@Override
	public String getText(String eMsg) throws IOException {
		HttpURLConnection con = null;
		BufferedReader bf = null;
		try {
			if (eMsg.length() > 300) {
				eMsg = eMsg.substring(0, 300);
			}

			String text = URLEncoder.encode(eMsg, "utf-8");
			URL url = new URL(apiURL);
			con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty(clientIdAdd, clientId);
			con.setRequestProperty(clientSecretAdd, clientSecret);
			// post request
			String postParams = "source = " + source + "&target = " + target + "&text = " + text;
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();

			return null;

		} catch (IOException e) {
			throw e;
		}
	}
}
