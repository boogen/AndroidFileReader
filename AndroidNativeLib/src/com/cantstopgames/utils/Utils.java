package com.cantstopgames.utils;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class Utils implements FREExtension {

	public FREContext createContext(String arg0) {
		return new UtilsContext();
	}

	public void dispose() {
		// TODO Auto-generated method stub

	}

	public void initialize() {
		// TODO Auto-generated method stub

	}

}
