package com.springsource.roo.inspect.web;

import com.springsource.roo.inspect.domain.InspectItemRec;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/inspectitemrecs")
@Controller
@RooWebScaffold(path = "inspectitemrecs", formBackingObject = InspectItemRec.class)
public class InspectItemRecController {
}
