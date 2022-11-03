package com.example.modelboard.mapper;

import com.example.modelboard.dto.BoardDTO;
import com.example.modelboard.dto.Criteria;

import java.util.List;

public interface BoardMapper {

    // 쓰기
    void write(BoardDTO boardDTO);

    // 게시물 목록
    int boardList();

    // 게시글 읽기
    BoardDTO read(Long bno);

    // 갱신
    void updateBoard(BoardDTO boardDTO);

    // 삭제
    void deleteBoard(Long bno);

    // 페이징
    //List<BoardDTO> getListWithPaging(Criteria cri);

    List<BoardDTO> getListWithPaging(int start, int end);
}
