package com.nullcorp.auction.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;

public class ItemFormWrapper implements Serializable{
    @Valid
    private Item item;
    @Valid
    private House house;
//    @Valid
//    private List<Image> images;

    public ItemFormWrapper() {
    }

    public ItemFormWrapper(Item item, House house, List<Image> images) {
        this.item = item;
        this.house = house;
//        this.images = images;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }
//
//    public List<Image> getImages() {
//        return images;
//    }
//
//    public void setImages(List<Image> images) {
//        this.images = images;
//    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 89 * hash + Objects.hashCode(this.item);
        hash = 89 * hash + Objects.hashCode(this.house);
//        hash = 89 * hash + Objects.hashCode(this.images);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ItemFormWrapper other = (ItemFormWrapper) obj;
        if (!Objects.equals(this.item, other.item)) {
            return false;
        }
        if (!Objects.equals(this.house, other.house)) {
            return false;
        }
//        if (!Objects.equals(this.images, other.images)) {
//            return false;
//        }
        return true;
    }

    @Override
    public String toString() {
        return "ItemFormWrapper{" + "item=" + item + ", house=" + house + ", images=" +
//                images +
                '}';
    }

}
