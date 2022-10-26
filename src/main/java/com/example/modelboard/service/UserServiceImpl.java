package com.example.modelboard.service;

import com.example.modelboard.dto.UserDTO;
import com.example.modelboard.mapper.UserMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    @Override
    public void join(UserDTO userDTO){
        userMapper.join(userDTO);
    }

    @Override
    public int doubleIdCheck(String checkUsername){
       int result =  userMapper.doubleIdCheck(checkUsername);
       return result;
    }@Override
    public UserDTO login(UserDTO userDTO){
       return userMapper.login(userDTO);
    }
}
