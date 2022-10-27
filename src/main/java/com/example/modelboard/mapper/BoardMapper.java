package com.example.modelboard.mapper;

import com.example.modelboard.dto.BoardDTO;

import java.util.List;

public interface BoardMapper {
    void write(BoardDTO boardDTO);
    List<BoardDTO> boardList();
}
