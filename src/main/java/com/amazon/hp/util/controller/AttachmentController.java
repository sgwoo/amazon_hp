package com.amazon.hp.util.controller;

import java.io.File;
import java.io.IOException;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
/**
 * 
 * 테스트 용도로 생성, 운영에서는 안씁니다
 * @author kyungsuk Cho
 *
 */
@Controller
@RequestMapping("/attachments")
public class AttachmentController {

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> uploadAttachment(@RequestParam("uploadfile") MultipartFile sourceFile) throws IOException {

        String sourceFileName = sourceFile.getOriginalFilename();
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();

        File destinationFile;
        String destinationFileName;
        do {
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
            destinationFile = new File("C:/dev/workspace/amazon_hp/upload/" + destinationFileName);
        } while (destinationFile.exists());
        destinationFile.getParentFile().mkdirs();
        sourceFile.transferTo(destinationFile);

        UploadAttachmentResponse response = new UploadAttachmentResponse();
        response.setFileName(sourceFile.getOriginalFilename());
        response.setFileSize(sourceFile.getSize());
        response.setFileContentType(sourceFile.getContentType());
        response.setAttachmentUrl("http://dev.amazoncar.com:8080/attachments/" + destinationFileName);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @NoArgsConstructor
    @Data
    private static class UploadAttachmentResponse {
        
        private String fileName;
        private long fileSize;
        private String fileContentType;
        private String attachmentUrl;
        
        public String getFileName() {
            return fileName;
        }
        public void setFileName(String fileName) {
            this.fileName = fileName;
        }
        public long getFileSize() {
            return fileSize;
        }
        public void setFileSize(long fileSize) {
            this.fileSize = fileSize;
        }
        public String getFileContentType() {
            return fileContentType;
        }
        public void setFileContentType(String fileContentType) {
            this.fileContentType = fileContentType;
        }
        public String getAttachmentUrl() {
            return attachmentUrl;
        }
        public void setAttachmentUrl(String attachmentUrl) {
            this.attachmentUrl = attachmentUrl;
        }
        
    }
}
