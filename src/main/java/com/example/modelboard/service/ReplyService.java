package com.example.modelboard.service;

import com.example.modelboard.dto.ReplyDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ReplyService {


    List<ReplyDTO> replyList(int bno);
}
