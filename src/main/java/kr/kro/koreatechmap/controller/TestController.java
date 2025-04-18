package kr.kro.koreatechmap.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/api/test")
@Tag(name = "테스트 API", description = "테스트용 API 엔드포인트")
public class TestController {

    @GetMapping("/hello")
    @Operation(summary = "헬로 월드", description = "간단한 인사말을 반환합니다.")
    public String hello() {
        return "안녕하세요! KKL_API입니다.";
    }

    @GetMapping("/echo/{message}")
    @Operation(summary = "에코", description = "입력받은 메시지를 그대로 반환합니다.")
    public String echo(@PathVariable String message) {
        return "받은 메시지: " + message;
    }

    @PostMapping("/sum")
    @Operation(summary = "덧셈", description = "두 숫자를 더합니다.")
    public int sum(@RequestParam int a, @RequestParam int b) {
        return a + b;
    }
} 