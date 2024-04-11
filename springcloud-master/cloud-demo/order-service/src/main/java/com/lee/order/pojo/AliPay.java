package com.lee.order.pojo;

import lombok.Data;

@Data
public class AliPay {
    private String traceNo;
    private double totalAmount;
    private String subject;
    private String alipayTraceNo;
    private String return_url;
    private String account;
    private String password;
}