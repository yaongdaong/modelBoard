package com.example.modelboard.controller;

import com.example.modelboard.dto.UserDTO;
import com.example.modelboard.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    final
    UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String main() {
        return "user/login";
    }

    @GetMapping("/join")
    public String join() {
        return "user/join";
    }


    @PostMapping("/join")
    public String join(UserDTO userDTO) {
        userService.join(userDTO);
        return "user/login";
    }

    @PostMapping("/doubleIdCheck")
    @ResponseBody
    public int doubleIdCheck(@RequestParam("username") String username) {
        int result = userService.doubleIdCheck(username);
        return result;
    }


    @GetMapping("/login")
    public String login() {
        return "user/login";
    }

    @PostMapping("/login")
    public String login(UserDTO userDTO, HttpSession session) {
        // UserDTO : db에 저장된 회원 정보, userDTO : 사용자가 입력한 회원 정보
        UserDTO getUser = userService.login(userDTO);
        if (getUser != null) {
            session.setAttribute("user",userDTO.getUsername());
            return "redirect:/boardList";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        if(session!=null){
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/admin")
    public String admin(){
        return "user/admin";
    }
}
