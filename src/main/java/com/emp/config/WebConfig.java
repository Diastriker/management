package com.emp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.emp.interceptor.Interceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	private Interceptor interceptor;
	
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**") // 모든 경로
                .allowedOrigins("http://192.*:*") // 허용할 프론트 주소 // 허용할 프론트 주소
                .allowedOrigins("http://localhost:9090") // 허용할 프론트 주소 // 허용할 프론트 주소
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS") // 허용할 HTTP 메서드
                .allowedHeaders("*") // 모든 헤더 허용
                .allowCredentials(true) // 쿠키 허용 여부
                .maxAge(3600); // pre-flight 캐싱 시간 (초)
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	registry.addInterceptor(interceptor)
    			.addPathPatterns("/**")
    			.excludePathPatterns(
    				"/",
    				"/login",
    				"/css/**",
    				"/images/**",
    				"/js/**"
    				);
    }
    
}
