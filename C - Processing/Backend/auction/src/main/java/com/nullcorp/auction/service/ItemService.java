package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.Item;
import java.util.List;


public interface ItemService {
    List<Item> getAllItems(Integer id);
}
