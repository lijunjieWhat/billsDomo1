package com.soft863.bean;

import java.io.Serializable;

/**
 * @author lijunjie
 * @version 1.0
 * @date 2019/1/30 16:05
 */
public class Bills implements Serializable {
    private Integer id;
    private String title;
    private String date;
    private String price;
    private String content;
    private BillsType billsType;

    public Bills() {
    }

    public Bills(Integer id, String title, String date, String price, String content, BillsType billsType) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.price = price;
        this.content = content;
        this.billsType = billsType;
    }

    public Bills(String title, String date, String price, String content, BillsType billsType) {
        this.title = title;
        this.date = date;
        this.price = price;
        this.content = content;
        this.billsType = billsType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public BillsType getBillsType() {
        return billsType;
    }

    public void setBillsType(BillsType billsType) {
        this.billsType = billsType;
    }

    @Override
    public String toString() {
        return "Bills{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", date='" + date + '\'' +
                ", price='" + price + '\'' +
                ", content='" + content + '\'' +
                ", billsType=" + billsType +
                '}';
    }
}
