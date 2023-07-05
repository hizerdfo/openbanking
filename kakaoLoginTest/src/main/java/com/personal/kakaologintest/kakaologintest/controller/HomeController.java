package com.personal.kakaologintest.kakaologintest.controller;

import com.personal.kakaologintest.kakaologintest.repository.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.personal.kakaologintest.kakaologintest.service.KakaoAPI;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
@Controller
public class HomeController {

    @Autowired
    private KakaoAPI kakao;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping(value = "/")
    public String index() {
        return "index";
    }
    //카카오 로그인
    @RequestMapping(value="/login")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);

        // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("loginType", "kakao");

            // 이메일을 UserDTO에 저장하고 데이터베이스에 연결하여 로그인 처리
            String email = (String) userInfo.get("email");
            UserDTO user = new UserDTO();
            user.setEmail(email);

            // 데이터베이스에서 동일한 이메일을 가진 유저가 있는지 확인
            String query = "SELECT COUNT(*) FROM user_table WHERE email = ?";
            int count = jdbcTemplate.queryForObject(query, Integer.class, email);

            if (count > 0) {
                // 동일한 이메일을 가진 유저가 있다면 로그인 성공 처리
                return "success";
            } else {
                // 동일한 이메일을 가진 유저가 없다면 로그인 실패 처리
                return "failure";
            }
        }
        return "index";
    }

    @RequestMapping(value="/login/regular")
    public String login(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session) {
        // 데이터베이스에서 입력한 아이디와 비밀번호를 사용하여 유저 정보 조회
        String query = "SELECT * FROM user_table WHERE id = ? AND password = ?";
        UserDTO user = jdbcTemplate.queryForObject(query, new Object[]{id, password}, new BeanPropertyRowMapper<>(UserDTO.class));

        if (user != null) {
            // 로그인 성공
            session.setAttribute("userId", user.getId());
            session.setAttribute("loginType", "regular"); // 일반 사용자로 로그인
            return "success";
        } else {
            // 로그인 실패
            return "failure";
        }
    }

    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        String loginType = (String) session.getAttribute("loginType");
        if (loginType != null && loginType.equals("kakao")) {
            // 카카오 로그아웃 처리
            String accessToken = (String) session.getAttribute("access_Token");
            if (accessToken != null) {
                kakao.kakaoLogout(accessToken);
                session.removeAttribute("access_Token");
                System.out.println("카카오 로그아웃");
            }
        } else {
            // 일반 로그아웃 처리
            System.out.println("일반 로그아웃");
        }

        session.removeAttribute("userId");
        session.removeAttribute("loginType");
        session.invalidate();
        return "redirect:/";
    }


    // 일반 로그아웃
    @RequestMapping(value = "/logout/regular")
    public String regularLogout(HttpSession session) {
        session.removeAttribute("access_Token");
        session.removeAttribute("userId");
        System.out.println("일반 로그아웃");
        return "index";
    }

}