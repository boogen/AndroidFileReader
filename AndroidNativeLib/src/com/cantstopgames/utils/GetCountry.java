package com.cantstopgames.utils;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class GetCountry implements FREFunction {
	public FREObject call(FREContext context, FREObject[] args) {
		UtilsContext frc = (UtilsContext)context;
		String country = frc.getActivity().getResources().getConfiguration().locale.getCountry();
		FREObject result = null;
		try {
			result = FREObject.newObject(country);
		} catch (FREWrongThreadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
