package com.example.modelboard.mapper;

import com.example.modelboard.dto.ReplyDTO;

import java.util.List;

public interface ReplyMapper {
    void replyWrite(ReplyDTO replyDTO);
    List<ReplyDTO> replyList(int bno);


    void replyModify(ReplyDTO replyDTO);

    void replyDelete(Long rno);
}
