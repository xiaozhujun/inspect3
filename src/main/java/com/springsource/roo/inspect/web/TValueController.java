package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.TValue;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tvalues")
@Controller
@RooWebScaffold(path = "tvalues", formBackingObject = TValue.class,update=false)
public class TValueController {
}
