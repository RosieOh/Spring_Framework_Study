package chap02;

public class Greeter {

    private String format;

    // format 필드는 setFormat() 메서드로 설정함
    public String greet(String guest) {
        return String.format(format, guest);
    }

    public void setFormat(String format) {
        this.format = format;
    }
}
