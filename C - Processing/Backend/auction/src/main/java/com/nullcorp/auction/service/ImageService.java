
package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.Image;
import com.nullcorp.auction.entity.Item;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;


public interface ImageService {


    public void createOrUpdateImage(Image i);

    public List<Image> getAllImagesByHouse(Integer id);


    
}
