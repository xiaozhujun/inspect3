package com.springsource.roo.inspect.domain;

import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class InspectItemRecord {

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createtime;

    private String ivalue;

    @ManyToOne
    private InspectTable inspecttable;

    @ManyToOne
    private InspectTag tag;

    @ManyToOne
    private InspectItem item;

    @ManyToOne
    private InspectTableRecord inspecttablerec;

    @ManyToOne
    private Users worker;
}
