package com.amazon.hp.util.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	
	//@RequestMapping("/fileDown/{bno}")
	@RequestMapping("/fileDown/applyContest")
    private void fileDown(/*@PathVariable int bno,*/ HttpServletRequest request, HttpServletResponse response, @RequestParam(value="url")String fileUrl) throws Exception{
        request.setCharacterEncoding("UTF-8");
        //FileVO fileVO = memberService.fileDetailService(bno);
        //파일 업로드된 경로 
        try{
            //String fileUrl = "C:/develop/workspace/amazon_hp/src/main/webapp/resources/files"; //fileVO.getFileUrl();
            //String fileUrl = "/usr/local/apache-tomcat-8.0.37/webapps/amazon_hp/resources/files";
            fileUrl += "/"; 
            String savePath = fileUrl;
            String fileName = "acar_CIcontest_apply.rtf"; //fileVO.getFileName();
            
            //실제 내보낼 파일명 
            String oriFileName = "CI공모전_참가신청서.rtf";//fileVO.getFileOriName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
            }
            in.close();
            os.close();
        } catch (Exception e) {
        }
        
    }

}
