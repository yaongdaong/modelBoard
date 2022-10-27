package com.example.modelboard.dto;

import lombok.Data;

import java.util.Date;

@Data
public class BoardDTO {
    int bno;
    String title;
    String content;
    String writer;
    Date regdate;

}
