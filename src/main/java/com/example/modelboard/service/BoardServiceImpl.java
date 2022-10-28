package com.example.modelboard.service;

import com.example.modelboard.dto.BoardDTO;
import com.example.modelboard.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor // 모든 필드 값을 파라미터로 받는 생성자를 만듦
public class BoardServiceImpl implements BoardService{

    private BoardMapper boardMapper;

    @Override
    public void write(BoardDTO boardDTO){boardMapper.write(boardDTO);}

    @Override
    public List<BoardDTO> boardList(){return boardMapper.boardList();}

    @Override
    public BoardDTO read(Long bno) {return boardMapper.read(bno);}

    @Override
    public void updateBoard(BoardDTO boardDTO) {
        boardMapper.updateBoard(boardDTO);
    }

    @Override
    public void deleteBoard(Long bno) {
        boardMapper.deleteBoard(bno);
    }

}
