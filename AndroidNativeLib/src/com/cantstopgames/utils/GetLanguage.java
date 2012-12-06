package com.cantstopgames.utils;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class GetLanguage implements FREFunction {
	public FREObject call(FREContext context, FREObject[] args) {
		UtilsContext frc = (UtilsContext)context;
		String language = frc.getActivity().getResources().getConfiguration().locale.getLanguage();
		FREObject result = null;
		try {
			result = FREObject.newObject(language);
		} catch (FREWrongThreadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
