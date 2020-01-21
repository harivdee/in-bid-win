
package com.nullcorp.auction.entity;


public class OrderDetail {
    
    private Double credits;

    public OrderDetail() {
    }

    public OrderDetail(String credits,
            String tax, String total) {
        this.credits = Double.parseDouble(credits);
    }

    public Double getCredits() {
        return credits;
    }

    public void setCredits(Double credits) {
        this.credits = credits;
    }

    //Paypal needs these values to be Strings
    public String getStringSubtotal() {
        return String.format("%.2f", credits).replace(",", ".");
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "credits=" + credits + '}';
    }
    

}
