package com.example.modelboard.controller;

import com.example.modelboard.dto.ReplyDTO;
import com.example.modelboard.service.ReplyService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ReplyController {

    final ReplyService replyService;

    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }


    @RequestMapping("/replyList")
    public List<ReplyDTO> replyList(@RequestParam(value = "bno") int bno) {
        System.out.println(bno);
        List<ReplyDTO> replyList = replyService.replyList(bno);
        System.out.println(replyList);
        return replyList;
    }



}
