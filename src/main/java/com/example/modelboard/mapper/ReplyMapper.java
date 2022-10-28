package com.example.modelboard.mapper;

import com.example.modelboard.dto.ReplyDTO;

import java.util.List;

public interface ReplyMapper {
    List<ReplyDTO> replyList(int bno);
}
