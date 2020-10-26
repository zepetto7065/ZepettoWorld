package com.zepetto.renew.world.Board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView("board/list");
        return modelAndView;
    }

}
