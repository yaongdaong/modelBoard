package com.example.modelboard.mapper;

import com.example.modelboard.dto.UserDTO;

public interface UserMapper {
    void join(UserDTO userDTO) ;
    UserDTO login(UserDTO userDTO) ;
}
