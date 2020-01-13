
package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.Image;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;


public interface ImageService {

    public void saveThumbnail(MultipartFile file);

    public void createOrUpdateImage(Image i);

    public List<Image> getAllImagesByHouse(Integer id);
    
}
