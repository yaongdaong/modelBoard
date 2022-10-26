package com.example.modelboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

    // redirect는 url 주소로 가고, return은 jsp 페이지를 띄워준다.
    @GetMapping("/boardList")
    public String boardList() {
        return "board/boardList";
    }
}
