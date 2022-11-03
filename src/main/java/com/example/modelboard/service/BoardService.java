package com.example.modelboard.service;

import com.example.modelboard.dto.BoardDTO;
import com.example.modelboard.dto.Criteria;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BoardService {

    void write(BoardDTO boardDTO);
    int boardList();
    List<BoardDTO> boardList(Criteria cri);
    BoardDTO read(Long bno);


    void updateBoard(BoardDTO boardDTO);

    void deleteBoard(Long bno);
}
