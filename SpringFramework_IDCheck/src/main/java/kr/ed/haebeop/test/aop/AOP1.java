package kr.ed.haebeop.test.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Aspect
@Component
public class AOP1 {

    //kr.ed.haebeop.test.aop 패키지 하위에 있는 메소드가 실행되기 전에
    //@Before 어노테이션이 선언되어 있으면, 먼저 실행되고,
    //포인트컷이 정상 실행되어 리턴되면 @AfterReturning 어노테이션이 선언된 부분이 실행됨

    //kr.ed.haebeop.test.aop 패키지의 하위 메소드를 모두 포인트컷으로 설정함
    @Pointcut("execution(* kr.ed.haebeop.test.aop..*.*(..))")
    private void cut() {
        System.out.println("AOP 실습1");
    }

    @Pointcut("@annotation(kr.ed.haebeop.test.aop.Timer)")
    private void enableTimer() {
        System.out.println("AOP 실습2");
    }

    @Before("cut()")
    public void before(JoinPoint joinPoint) {
        System.out.println("--------------- @Before ---------------");
        System.out.println(joinPoint.toString());
        System.out.println(joinPoint.toShortString());
        System.out.println(joinPoint.toLongString());
    }

    @AfterReturning(value = "cut()", returning = "object")
    public void afterReturn(JoinPoint joinPoint, Object object) {
        System.out.println("--------------- @After ---------------");
        System.out.println(object);
    }

    @Around("cut() && enableTimer()")
    public void around(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println("--------------- @Around ---------------");
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        // 타겟 오브젝트의 메서드 실행(controller 패키지 하위 클래스들의 메소드)
        Object result = joinPoint.proceed();
        System.out.println("result: " + result);
        stopWatch.stop();
        System.out.println("Total Time: " + stopWatch.getTotalTimeSeconds());
    }
}