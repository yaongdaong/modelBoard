package com.example.modelboard.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class DataSourceConfig {
    @ConfigurationProperties(prefix = "spring.datasource")
    // datasource가 application.properties에 spring.datasource로 시작되는 값들을 참조
    @Bean
    public DataSource dataSource() {
        return DataSourceBuilder.create().build();
    }
}
