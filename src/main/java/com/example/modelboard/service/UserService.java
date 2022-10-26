package com.example.modelboard.service;

import com.example.modelboard.dto.UserDTO;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    void join(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
}
