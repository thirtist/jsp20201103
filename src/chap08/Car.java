package chap08;

public class Car {
	private String name;
	private int speed;
	
	//stop
	public boolean isStop() { //boolean을 리턴하는 프로퍼티는 앞에 is를 붙여도됨
								// 따라서 여기서 메소드이름을 isStop바꿔도됨
		return false;
	}
	
	//name 프로퍼티
	public String getName() {
		return name;
	}
	
	//name 프로퍼티
	public void setName(String name) {
		this.name = name;
	}
	
	//speed 프로퍼티
	public int getSpeed() {
		return speed;
	}
	
	//speed 프로퍼티
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	
	
}
