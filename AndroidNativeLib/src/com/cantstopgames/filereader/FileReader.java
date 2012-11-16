package com.cantstopgames.filereader;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class FileReader implements FREExtension {

	public FREContext createContext(String arg0) {
		return new FileReaderContext();
	}

	public void dispose() {
		// TODO Auto-generated method stub

	}

	public void initialize() {
		// TODO Auto-generated method stub

	}

}
