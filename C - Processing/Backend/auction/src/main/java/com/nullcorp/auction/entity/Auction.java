/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nullcorp.auction.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author datura
 */
@Entity
@Table(name = "auction")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Auction.findAll", query = "SELECT a FROM Auction a"),
    @NamedQuery(name = "Auction.findByAuctionid", query = "SELECT a FROM Auction a WHERE a.auctionid = :auctionid"),
    @NamedQuery(name = "Auction.deleteByAuctionid", query = "DELETE FROM Auction a WHERE a.auctionid = :auctionid"),
    @NamedQuery(name = "Auction.findByAincrement", query = "SELECT a FROM Auction a WHERE a.aincrement = :aincrement"),
    @NamedQuery(name = "Auction.findByAreserve", query = "SELECT a FROM Auction a WHERE a.areserve = :areserve"),
    @NamedQuery(name = "Auction.findByStime", query = "SELECT a FROM Auction a WHERE a.stime = :stime"),
    @NamedQuery(name = "Auction.findByEtime", query = "SELECT a FROM Auction a WHERE a.etime = :etime")})
public class Auction implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "auctionid")
    private Integer auctionid;
    @Column(name = "aincrement")
    private Integer aincrement;
    @Column(name = "areserve")
    private Integer areserve;
    @Column(name = "stime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date stime;
    @Column(name = "etime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date etime;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "auction")
    private List<Bid> bidList;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "auction")
//    private List<Transaction> transactionList;
    @JoinColumn(name = "item", referencedColumnName = "itemid")
    @ManyToOne(optional = false)
    private Item item;

    public Auction() {
    }

    public Auction(Integer auctionid) {
        this.auctionid = auctionid;
    }

    public Integer getAuctionid() {
        return auctionid;
    }

    public void setAuctionid(Integer auctionid) {
        this.auctionid = auctionid;
    }

    public Integer getAincrement() {
        return aincrement;
    }

    public void setAincrement(Integer aincrement) {
        this.aincrement = aincrement;
    }

    public Integer getAreserve() {
        return areserve;
    }

    public void setAreserve(Integer areserve) {
        this.areserve = areserve;
    }

    public Date getStime() {
        return stime;
    }

    public void setStime(Date stime) {
        this.stime = stime;
    }

    public Date getEtime() {
        return etime;
    }

    public void setEtime(Date etime) {
        this.etime = etime;
    }

    @XmlTransient
    public List<Bid> getBidList() {
        return bidList;
    }

    public void setBidList(List<Bid> bidList) {
        this.bidList = bidList;
    }

//    @XmlTransient
//    public List<Transaction> getTransactionList() {
//        return transactionList;
//    }
//
//    public void setTransactionList(List<Transaction> transactionList) {
//        this.transactionList = transactionList;
//    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (auctionid != null ? auctionid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Auction)) {
            return false;
        }
        Auction other = (Auction) object;
        if ((this.auctionid == null && other.auctionid != null) || (this.auctionid != null && !this.auctionid.equals(other.auctionid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nullcorp.auction.entity.Auction[ auctionid=" + auctionid + " ]";
    }
    
}
