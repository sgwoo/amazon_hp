package com.amazon.hp.common;

import com.amazon.hp.member.util.exception.CustomAuthException;
import com.amazon.hp.member.util.exception.DuplicateEmailException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

/**
 * Created by jjlim on 2017. 4. 20..
 */

@ControllerAdvice
public class GlobalExceptionHandler {

    /*
     * 로그인이 필요한 페이지에 비로그인 회원이 들어왔을 때 (url)
     * */
    @ExceptionHandler(CustomAuthException.class)
    public ModelAndView LoginAuthError(HttpServletRequest req, CustomAuthException exception) {

        ModelAndView mav = new ModelAndView();

        mav.addObject("loginUrl","true");
        mav.addObject("exception", exception);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName("errorLogin");

        return mav;
    }

    /*
     * 회원가입시 이메일 중복인 경우
     * */
    @ExceptionHandler(DuplicateEmailException.class)
    public ModelAndView RegisterError(HttpServletRequest req, DuplicateEmailException exception) {

        ModelAndView mav = new ModelAndView();
        mav.addObject("loginUrl","true");
        mav.addObject("exception", exception);
        mav.addObject("url", req.getRequestURL());        
        mav.setViewName("error");

        return mav;

    }

}
