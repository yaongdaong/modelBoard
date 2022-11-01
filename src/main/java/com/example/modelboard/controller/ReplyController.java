package com.example.modelboard.controller;

import com.example.modelboard.dto.BoardDTO;
import com.example.modelboard.dto.ReplyDTO;
import com.example.modelboard.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
public class ReplyController {

    final ReplyService replyService;

    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }

    // 댓글 쓰기
    @PostMapping("/replyWrite")
    public ReplyDTO replyWrite(Long bno, String reply, String replyer) {
        ReplyDTO replyDTO = new ReplyDTO();
        replyDTO.setRno(replyDTO.getRno());
        replyDTO.setBno(bno);
        replyDTO.setReply(reply);
        replyDTO.setReplyer(replyer);
        replyDTO.setReplyDate(new Date());
        replyService.replyWrite(replyDTO);
        return replyDTO;
    }

    // 댓글 읽기
    @RequestMapping("/replyList")
    public List<ReplyDTO> replyList(@RequestParam(value = "bno") int bno) {
        List<ReplyDTO> replyList = replyService.replyList(bno);
        return replyList;
    }

    // 댓글 수정
    @PostMapping("/replyModify")
    public ReplyDTO replyModify(Long rno, String reply) {
        System.out.println(reply);
        ReplyDTO replyDTO = new ReplyDTO();
        replyDTO.setRno(rno);
        replyDTO.setReply(reply);
        replyService.replyModify(replyDTO);

        return replyDTO;
    }

    // 댓글 삭제
    @PostMapping ("/replyDelete")
    public void replyDelete(Long rno) {
        replyService.replyDelete(rno);
    }
}
