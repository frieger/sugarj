package org.sugarj;

import org.sugarj.common.Log;

/**
 * @author Sebastian Erdweg <seba at informatik uni-marburg de>
 */

public class FomegaMstLibFactory extends LanguageLibFactory {

	private FomegaMstLibFactory() { }
	
	private static FomegaMstLibFactory instance = new FomegaMstLibFactory();
	
	public static FomegaMstLibFactory getInstance() {
		return instance;
	}
	
	/**
	 * @see org.sugarj.LanguageLibFactory#createLanguageLibrary()
	 */
	@Override
	public LanguageLib createLanguageLibrary() {
	  Log.log.setLoggingLevel(Log.ALWAYS);
		return new FomegaMstLib();
	}

}
