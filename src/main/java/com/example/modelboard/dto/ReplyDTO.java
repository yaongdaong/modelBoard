package com.example.modelboard.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyDTO {
    private Long rno;
    private Long bno;
    private String reply;
    private String replyer;
    private Date replyDate;
}
