package com.peachs.controller;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class ImageController {

    @GetMapping("/image/{imageName}")
    public ResponseEntity<ByteArrayResource> loadImage(@PathVariable String imageName) throws IOException {
        // 로컬 파일 시스템의 이미지 경로
        String imagePath = "C:/datazip/testzip/" + imageName;

        // 이미지 파일을 읽어서 byte 배열로 변환
        Path path = Paths.get(imagePath);
        byte[] imageBytes = Files.readAllBytes(path);

        // 이미지의 MIME 타입 지정
        MediaType mediaType = MediaType.IMAGE_JPEG; // 이미지 타입에 맞게 변경

        // HTTP 응답 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(mediaType);

        // ByteArrayResource를 사용하여 이미지 데이터를 반환
        ByteArrayResource resource = new ByteArrayResource(imageBytes);

        // ResponseEntity를 통해 이미지 데이터와 함께 상태 코드와 헤더를 반환
        return ResponseEntity.ok()
                .headers(headers)
                .contentLength(imageBytes.length)
                .body(resource);
    }
}