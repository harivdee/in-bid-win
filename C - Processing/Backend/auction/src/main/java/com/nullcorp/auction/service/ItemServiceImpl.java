
package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.ItemDao;
import com.nullcorp.auction.entity.Item;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ItemServiceImpl implements ItemService{
    @Autowired
    ItemDao idao;
    
    @Override
    public List<Item> getAllItems(Integer id) {
        return idao.findAll(id);
    }
    
}
