package com.cantstopgames.utils;



import android.opengl.GLES20;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class GetGraphicsDeviceName implements FREFunction {
	public FREObject call(FREContext context, FREObject[] args) {		
		String graphics = GLES20.glGetString(GLES20.GL_RENDERER);		
		FREObject result = null;
		try {
			result = FREObject.newObject(graphics);
		} catch (FREWrongThreadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
