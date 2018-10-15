package aop.log;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AspectLogger {
	private static final Logger logger = LoggerFactory.getLogger(AspectLogger.class);
	@Before("execution(* com.bass.test.controller.URIController.*(..))")
	public void beforeLog(JoinPoint jp) {
		logger.debug("jp=>{}",jp);
	}
}
