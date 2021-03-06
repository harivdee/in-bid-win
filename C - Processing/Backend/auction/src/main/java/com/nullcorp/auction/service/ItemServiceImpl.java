package com.nullcorp.auction.service;

import com.nullcorp.auction.ItemStatusEnum;
import com.nullcorp.auction.dao.ItemDao;
import com.nullcorp.auction.entity.Item;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ItemServiceImpl implements ItemService {

    @Autowired
    ItemDao idao;

    @Override
    public List<Item> getAllItemsByUser(Integer id) {
        return idao.findAllByUser(id);
    }
    
    @Override
    public List<Item> getAllItemsByUsername(String username) {
        return idao.findAllByUsername(username);
    }

    @Override
    public Item getItemById(Integer id) {
        return idao.findByid(id);
    }
    
    @Override
    public void createOrUpdateItem(Item i) {
        i.setIstatus(ItemStatusEnum.DISABLED.toString());
        idao.createOrUpdate(i);
    }


    @Override
    public void delete(Item i) {
        idao.del(i);
    }

    @Override
    public void toggleStatus(Item i) {
        idao.toggleStatus(i);
    }

    @Override
    public void terminateStatus(Item i) {
        idao.terminateStatus(i);
    }   

}
