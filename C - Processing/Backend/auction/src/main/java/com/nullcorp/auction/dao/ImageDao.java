
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Image;
import java.util.List;


public interface ImageDao {

    public void saveOrUpdate(Image i);

    public List<Image> getAllImagesByHouse(Integer id);
    
}
