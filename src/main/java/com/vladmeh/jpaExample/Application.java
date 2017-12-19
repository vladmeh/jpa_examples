package com.vladmeh.jpaExample;

import com.vladmeh.jpaExample.Entity.Address;
import com.vladmeh.jpaExample.Repository.AddressRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Application {

    private static final Logger log = LoggerFactory.getLogger(Application.class);

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner demo(AddressRepository repository){
        return (args) -> {
            /*Address address = new Address();
            address.setCity("Dhaka")
                    .setCountry("Bangladesh")
                    .setPostcode("1000")
                    .setStreet("Poribagh");

            repository.save(address);*/

            // fetch all customers
            log.info("Customers found with findAll():");
            log.info("-------------------------------");
            for (Address addr : repository.findAll()) {
                log.info(addr.toString());
            }
            log.info("");
        };
    }
}
