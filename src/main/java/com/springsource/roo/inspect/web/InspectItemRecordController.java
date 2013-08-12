package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.InspectItemRecord;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/inspectitemrecords")
@Controller
@RooWebScaffold(path = "inspectitemrecords", formBackingObject = InspectItemRecord.class,update=false)
public class InspectItemRecordController {
}
