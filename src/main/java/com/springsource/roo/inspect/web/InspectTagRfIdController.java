package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.InspectTagRfId;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/inspecttagrfids")
@Controller
@RooWebScaffold(path = "inspecttagrfids", formBackingObject = InspectTagRfId.class)
public class InspectTagRfIdController {
}
