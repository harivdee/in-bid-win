package com.nullcorp.auction.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "house")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "House.findAll", query = "SELECT h FROM House h"),
    @NamedQuery(name = "House.findByHid", query = "SELECT h FROM House h WHERE h.hid = :hid"),
    @NamedQuery(name = "House.findByHlocation", query = "SELECT h FROM House h WHERE h.hlocation = :hlocation"),
    @NamedQuery(name = "House.findByHfloor", query = "SELECT h FROM House h WHERE h.hfloor = :hfloor"),
    @NamedQuery(name = "House.findByHsize", query = "SELECT h FROM House h WHERE h.hsize = :hsize"),
    @NamedQuery(name = "House.findByHroom", query = "SELECT h FROM House h WHERE h.hroom = :hroom"),
    @NamedQuery(name = "House.findByHbathroom", query = "SELECT h FROM House h WHERE h.hbathroom = :hbathroom"),
    @NamedQuery(name = "House.findByHheating", query = "SELECT h FROM House h WHERE h.hheating = :hheating"),
    @NamedQuery(name = "House.findByHfurnished", query = "SELECT h FROM House h WHERE h.hfurnished = :hfurnished"),
    @NamedQuery(name = "House.findByHdescr", query = "SELECT h FROM House h WHERE h.hdescr = :hdescr")})
public class House implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "hid")
    private Integer hid;
    @NotEmpty
    @Size(min = 1, max = 100)
    @Column(name = "hlocation")
    private String hlocation;
    @NotNull
    @Min(value = -1, message = "The value must be minimun -1")
    @Column(name = "hfloor")
    private Integer hfloor;
    @NotNull
    @Min(value = 5, message = "The value must be positive")
    @Column(name = "hsize")
    private Integer hsize;
    @NotNull
    @Min(value = 1, message = "The value must be positive")
    @Column(name = "hroom")
    private Integer hroom;
    @NotNull
    @Min(value = 1, message = "The value must be positive")
    @Column(name = "hbathroom")
    private Integer hbathroom;
    @NotEmpty
    @Size(max = 100)
    @Column(name = "hheating")
    private String hheating;
    @Lob
    @Column(name = "hphoto")
    private byte[] hphoto;
    @NotEmpty
    @Size(max = 3)
    @Column(name = "hfurnished")
    private String hfurnished;
    @NotEmpty
    @Size(max = 200)
    @Column(name = "hdescr")
    private String hdescr;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "house")
    private List<Image> imageList;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "house")
//    private List<Item> itemList;

    public House() {
    }

    public House(Integer hid) {
        this.hid = hid;
    }

    public House(Integer hid, String hlocation, byte[] hphoto) {
        this.hid = hid;
        this.hlocation = hlocation;
        this.hphoto = hphoto;
    }

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getHlocation() {
        return hlocation;
    }

    public void setHlocation(String hlocation) {
        this.hlocation = hlocation;
    }

    public Integer getHfloor() {
        return hfloor;
    }

    public void setHfloor(Integer hfloor) {
        this.hfloor = hfloor;
    }

    public Integer getHsize() {
        return hsize;
    }

    public void setHsize(Integer hsize) {
        this.hsize = hsize;
    }

    public Integer getHroom() {
        return hroom;
    }

    public void setHroom(Integer hroom) {
        this.hroom = hroom;
    }

    public Integer getHbathroom() {
        return hbathroom;
    }

    public void setHbathroom(Integer hbathroom) {
        this.hbathroom = hbathroom;
    }

    public String getHheating() {
        return hheating;
    }

    public void setHheating(String hheating) {
        this.hheating = hheating;
    }

    public byte[] getHphoto() {
        return hphoto;
    }

    public void setHphoto(byte[] hphoto) {
        this.hphoto = hphoto;
    }

    public String getHfurnished() {
        return hfurnished;
    }

    public void setHfurnished(String hfurnished) {
        this.hfurnished = hfurnished;
    }

    public String getHdescr() {
        return hdescr;
    }

    public void setHdescr(String hdescr) {
        this.hdescr = hdescr;
    }

    @XmlTransient
    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }

//    @XmlTransient
//    public List<Item> getItemList() {
//        return itemList;
//    }
//
//    public void setItemList(List<Item> itemList) {
//        this.itemList = itemList;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (hid != null ? hid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof House)) {
            return false;
        }
        House other = (House) object;
        if ((this.hid == null && other.hid != null) || (this.hid != null && !this.hid.equals(other.hid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nullcorp.auction.entity.House[ hid=" + hid + " ]";
    }
    
}
