package com.example.modelboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
// Criteria : 검색의 기준
public class Criteria {
    // pageNum : 페이지 번호
    private int pageNum;
    // amount : 한 페이지에 들어갈 글 개수
    private int amount;

    public Criteria(){
        this(1,10);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
