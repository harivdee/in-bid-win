package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.ImageDao;
import com.nullcorp.auction.entity.Image;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class ImageServiceImpl implements ImageService{
    @Autowired
    ImageDao idao;
    
    @Override
    public void saveThumbnail(MultipartFile file) {
        try {
            file.getBytes();
        } catch (IOException ex) {
            Logger.getLogger(ImageServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void createOrUpdateImage(Image i) {
        idao.saveOrUpdate(i);
    }

    @Override
    public List<Image> getAllImagesByHouse(Integer id) {
        return idao.getAllImagesByHouse(id);
    }
    
}
