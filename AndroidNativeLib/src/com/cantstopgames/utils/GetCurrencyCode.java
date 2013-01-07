package com.cantstopgames.utils;


import java.util.Currency;
import java.util.Locale;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class GetCurrencyCode implements FREFunction {
	public FREObject call(FREContext context, FREObject[] args) {
		UtilsContext frc = (UtilsContext)context;
		Locale locale = frc.getActivity().getResources().getConfiguration().locale;
		Currency currency = Currency.getInstance(locale);
	
		FREObject result = null;
		try {
			result = FREObject.newObject(currency.getCurrencyCode());
		} catch (FREWrongThreadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
