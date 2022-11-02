package com.example.modelboard.controller;

import com.example.modelboard.dto.BoardDTO;
import com.example.modelboard.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@SessionAttributes("user")
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
    public String write(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "board/write";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/write")
    public String writeComplete(BoardDTO boardDTO) {
        boardDTO.setRegdate(new Date());
        boardService.write(boardDTO);
        return "redirect:/boardList";

    }

    @GetMapping("/read")
    public String read(Long bno, Model model, HttpSession session) {
        if (session.getAttribute("user") != null) {
            BoardDTO boardDTO = boardService.read(bno);
            model.addAttribute("board", boardDTO);
            return "/board/read";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/updateBoard")
    public String updateBoard(Long bno, Model model, HttpSession session) {
        if (session.getAttribute("user") != null) {
            BoardDTO boardDTO = boardService.read(bno);
            model.addAttribute("board", boardDTO);
            return "/board/boardUpdate";
        } else {
            return "redirect:/login";
        }
    }


    @PostMapping("/updateBoard")
    @ResponseBody
    public String updateBoard(@RequestParam("bno") Long bno, @RequestParam("title") String title, @RequestParam("content") String content) {
        BoardDTO boardDTO = boardService.read(bno);
        boardDTO.setTitle(title);
        boardDTO.setContent(content);
        boardDTO.setRegdate(new Date());
        boardService.updateBoard(boardDTO);
        return "/read?bno=" + bno;
    }

    @PostMapping("/deleteBoard")
    @ResponseBody
    public String deleteBoard(@RequestParam("bno") Long bno, HttpSession session) {
        if (session.getAttribute("user") != null) {
            boardService.deleteBoard(bno);
            return "/boardList";
        } else {
            return "redirect:/login";
        }
    }
}

