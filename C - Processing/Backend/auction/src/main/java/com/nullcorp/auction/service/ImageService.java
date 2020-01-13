
package com.nullcorp.auction.service;

import org.springframework.web.multipart.MultipartFile;


public interface ImageService {

    public void saveThumbnail(MultipartFile file);
    
}
