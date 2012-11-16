package com.cantstopgames.filereader;

import android.content.res.AssetManager;

import com.adobe.fre.FREByteArray;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;

public class LoadFile implements FREFunction {
	
	private int[] t;

	public FREObject call(FREContext context, FREObject[] args) {
		try {			
	       /* DataInputStream dis = new DataInputStream(new FileInputStream(args[0].getAsString()));
	        byte[] theBytes = new byte[dis.available()];
	        dis.read(theBytes, 0, dis.available());
	        dis.close();
			*/
			
			//t = new int[256 * 1024 * 33];
			
			
			FileReaderContext frc = (FileReaderContext)context;
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
			
			//t = null;
			
			return result;
		} catch (Exception e) {
			return null;
		}
	}

}
