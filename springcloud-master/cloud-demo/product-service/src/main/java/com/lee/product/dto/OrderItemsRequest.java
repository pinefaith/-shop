package com.lee.product.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItemsRequest {
    private Integer order_id;
    private Integer user_id;
    private List<CartDetailsDTO> selectedItems;
}
