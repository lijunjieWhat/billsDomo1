package com.soft863.bean;

import java.io.Serializable;

/**
 * @author lijunjie
 * @version 1.0
 * @date 2019/1/30 16:07
 */
public class BillsType implements Serializable {
    private Integer id;
    private String name;

    public BillsType() {
    }

    public BillsType(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {

        this.name = name;
    }

    @Override
    public String toString() {
        return "BillsType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

