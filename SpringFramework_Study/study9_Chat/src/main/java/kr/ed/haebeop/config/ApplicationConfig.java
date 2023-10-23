package kr.ed.haebeop.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.persistence.RestDAO;
import kr.ed.haebeop.repository.TestRepository;
import kr.ed.haebeop.repository.TestRepositoryImpl;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.test.CheckVO;
import kr.ed.haebeop.test.transaction.TransactionRepository;
import kr.ed.haebeop.test.transaction.TransactionService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
@ComponentScan(basePackages = "kr.ed.haebeop")
public class ApplicationConfig {
    @Bean
    public TestService testService3(){
        return new TestServiceImpl();
    }

    @Bean
    public TestRepository testRepository3(){
        return new TestRepositoryImpl();
    }

    @Bean
    public TransactionRepository tranRepository() { return new TransactionRepository(); }

    @Bean
    public TransactionService tranService() { return new TransactionService(); }

    @Bean
    public CheckVO chk1() { return new CheckVO(); }

    @Bean
    public RestService restService() { return new RestService(); }

    @Bean
    public RestDAO restDao() { return new RestDAO(); }

    @Bean
    public SessionLocaleResolver localeResolver() { return new SessionLocaleResolver(); }

    @Bean
    public ObjectMapper mapper() { return new ObjectMapper(); }
}
