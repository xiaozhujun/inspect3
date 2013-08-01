package com.springsource.roo.inspect.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Device {

    /**
     */
    @Column(unique = true)
    private String devname;

    /**
     */
    private String description;

    /**
     */
    private String numbers;
}
