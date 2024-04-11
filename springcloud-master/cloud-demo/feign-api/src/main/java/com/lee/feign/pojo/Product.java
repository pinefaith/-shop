package com.lee.feign.pojo;

import java.math.BigDecimal;

public class Product {
    private Integer id;
    private String product_name;
    private String image_url;
    private Integer sort_id;
    private String message;
    private BigDecimal price;
    private Integer stock;
    private Integer popularity;

    public Product() {
    }

    public Product(Integer id, String product_name, String image_url, Integer sort_id,
                   String message, BigDecimal price, Integer stock, Integer popularity) {
        this.id = id;
        this.product_name = product_name;
        this.image_url = image_url;
        this.sort_id = sort_id;
        this.message = message;
        this.price = price;
        this.stock = stock;
        this.popularity = popularity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public Integer getSort_id() {
        return sort_id;
    }

    public void setSort_id(Integer sort_id) {
        this.sort_id = sort_id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getPopularity() {
        return popularity;
    }

    public void setPopularity(Integer popularity) {
        this.popularity = popularity;
    }
}
