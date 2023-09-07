import kr.co.teaspoon.dto.Sample;
import org.junit.After;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LombokTest2 {
    private static final Logger log = LoggerFactory.getLogger("LombokTest2.class");

    @BeforeClass
    public static void testStart() {
        System.out.println("전체 테스트 시작");
        // log.info("전체 테스트 시작");
    }

    @Test
    public void testBeforePrint() {
        System.out.println("JUnit 테스트 시작");
    }

    @Test
    public void testLombok() {
        Sample dto = new Sample();
        dto.setNo(1);
        dto.setName("오태훈");
        System.out.println(dto.toString());
        log.info(dto.toString());
    }

    @Test
    public void testLombok2() {
        Sample dto = new Sample();
        dto.setNo(2);
        dto.setName("윤은영");
        System.out.println(dto.toString());
        log.info(dto.toString());
    }

    @After
    public void testAfterPrint() {
        System.out.println("JUnit 테스트 종료");
    }
}
