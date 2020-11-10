package aloginpractice;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.HashMap;
import java.util.Map;

public class temp {
	public static void main(String[] args) {

		String path = "c:/temp/user.txt";
		InputStream is = new FileInputStream(path);
		ObjectInputStream ois;
		try {
			ois = new ObjectInputStream(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Object obj = ois.readObject();
		
		Map<String, User> map = new HashMap<>();
		
		if (obj instanceof Map<?,?> ) {	
			map = (Map<String, User>) obj;
		}

	}
}
