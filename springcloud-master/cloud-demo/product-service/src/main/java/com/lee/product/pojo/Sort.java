package com.lee.product.pojo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Data
@Getter
@Setter
public class Sort {
    private Integer id;
    private Integer parent_id;
    private String sort_name;
    private Integer level;
    private List<Sort> children = new ArrayList<>();
}
