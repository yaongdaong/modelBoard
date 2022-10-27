package com.example.modelboard.controller;

import com.example.modelboard.dto.BoardDTO;
import com.example.modelboard.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Date;

@Controller
public class BoardController {

    final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    // redirect는 url 주소로 가고, return은 jsp 페이지를 띄워준다.
    @GetMapping("/boardList")
    public String boardList(Model model) {
        model.addAttribute("boardList", boardService.boardList());
        return "board/boardList";
    }

    @GetMapping("/write")
    public String write() {return "board/write";}

    @PostMapping("/write")
    public String writeComplete(BoardDTO boardDTO) {
        System.out.println(boardDTO);
        boardDTO.setRegdate(new Date());
        boardService.write(boardDTO);
        return "redirect:/boardList";

    }

}
