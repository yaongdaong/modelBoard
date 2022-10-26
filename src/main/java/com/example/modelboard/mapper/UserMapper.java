package com.example.modelboard.mapper;

import com.example.modelboard.dto.UserDTO;

public interface UserMapper {
    void join(UserDTO userDTO) ;
    int doubleIdCheck(String checkUsername);
    UserDTO login(UserDTO userDTO) ;

}
