package com.nullcorp.auction.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageServiceImpl implements ImageService{

    @Override
    public void saveThumbnail(MultipartFile file) {
        try {
            file.getBytes();
        } catch (IOException ex) {
            Logger.getLogger(ImageServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
