package com.lee.order.dto;

import com.lee.feign.pojo.CartDetailsDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItemsRequest {
    private Long order_id;
    private Integer user_id;
    private List<CartDetailsDTO> selectedItems;
}
