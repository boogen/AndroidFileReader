package com.cantstopgames.filereader;

import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class FileReaderContext extends FREContext {

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functionMap = new java.util.HashMap<String, FREFunction>();
		functionMap.put("LoadFile", new LoadFile());
		return functionMap;
	}

}
