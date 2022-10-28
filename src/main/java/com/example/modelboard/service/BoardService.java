package com.example.modelboard.service;

import com.example.modelboard.dto.BoardDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BoardService {

    void write(BoardDTO boardDTO);
    List<BoardDTO> boardList();
    BoardDTO read(Long bno);


    void updateBoard(BoardDTO boardDTO);

    void deleteBoard(Long bno);
}
