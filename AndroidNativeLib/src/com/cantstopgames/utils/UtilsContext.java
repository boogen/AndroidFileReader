package com.cantstopgames.utils;

import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class UtilsContext extends FREContext {

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functionMap = new java.util.HashMap<String, FREFunction>();
		functionMap.put("LoadFile", new LoadFile());
		functionMap.put("GetCountry", new GetCountry());
		functionMap.put("GetLanguage", new GetLanguage());
		functionMap.put("GetCurrencyCode", new GetCurrencyCode());
		functionMap.put("GetCurrencySymbol", new GetCurrencySymbol());
		functionMap.put("GetGraphicsDeviceName", new GetGraphicsDeviceName());
		return functionMap;
	}

}
