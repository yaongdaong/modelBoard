package com.example.modelboard.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

    private int startPage;
    private int endPage;
    private boolean prev, next;

    private int total;
    private Criteria cri;

    public PageDTO(Criteria cri, int total){
        this.cri = cri;
        this.total = total;

        // 현재페이지가 3이면 10개씩 페이지를 표시할 때 3/10=0.3, Math.ceil은 올림이므로 0.3이 1이되고 1*10=10이므로 끝페이지는 10이 된다.
        this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0))*10;
        // 페이지를 10개씩 표시하면 첫페이지=끝페이지-9
        this.startPage = this.endPage - 9;
        // total : 전체 게시글 수, amount : 1페이지에 표시되는 게시글 수(10)
        // 게시글이 71개까지 있으면 페이지는 8페이지까지 있어야 한다.
        // (올림(71*1.0)/10) => 71.0을 올리면 8
        int realEnd = (int) (Math.ceil((total * 1.0)/cri.getAmount()));

        if (realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;

        this.next = this.endPage < realEnd;
    }
}
