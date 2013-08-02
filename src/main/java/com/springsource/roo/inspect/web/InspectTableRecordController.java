package com.springsource.roo.inspect.web;

import com.springsource.roo.inspect.domain.InspectTableRecord;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/inspecttablerecords")
@Controller
@RooWebScaffold(path = "inspecttablerecords", formBackingObject = InspectTableRecord.class)
public class InspectTableRecordController {
}
