package com.example.modelboard.service;

import com.example.modelboard.dto.ReplyDTO;
import com.example.modelboard.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
    ReplyMapper replyMapper;
    @Override
    public List<ReplyDTO> replyList(int bno) {
        return replyMapper.replyList(bno);
    }
}
