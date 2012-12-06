package com.cantstopgames.utils;

import android.content.res.AssetManager;

import com.adobe.fre.FREByteArray;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

import java.io.InputStream;
import java.nio.ByteBuffer;

public class LoadFile implements FREFunction {
	

	public FREObject call(FREContext context, FREObject[] args) {
		try {					
			
			UtilsContext frc = (UtilsContext)context;
			android.app.Activity activity = frc.getActivity();			
			
			AssetManager assetManager = activity.getAssets();
			
			InputStream stream = assetManager.open(args[0].getAsString(), 3);
			byte[] theBytes = new byte[stream.available()];
			stream.read(theBytes);
			
			FREByteArray result = FREByteArray.newByteArray();
			result.setProperty("length", FREObject.newObject(theBytes.length));
			result.acquire();
			
			ByteBuffer bytes = result.getBytes();
			bytes.put(theBytes);
			
			result.release();

			return result;
		} catch (Exception e) {
			return null;
		}
	}

}
