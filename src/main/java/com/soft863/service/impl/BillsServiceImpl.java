package com.soft863.service.impl;

import com.soft863.bean.Bills;
import com.soft863.bean.QueryVo;
import com.soft863.mapper.BillsMapper;
import com.soft863.service.BillsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillsServiceImpl implements BillsService {

    @Autowired
    private BillsMapper billsMapper;
    @Override
    public List<Bills> queryAllBillsBy(QueryVo vo) {
        return billsMapper.queryAllBillsBy(vo);
    }

    @Override
    public Integer queryCount( QueryVo vo) {
        return billsMapper.queryCount(vo);
    }

    @Override
    public Integer insertBills(Bills bills) {
        return billsMapper.insertBills(bills);
    }

    @Override
    public Bills queryBillsById(Integer id) {
        return billsMapper.queryBillsById(id);
    }

    @Override
    public Integer updateBills(Bills bills) {
        return billsMapper.updateBills(bills);
    }

    @Override
    public Integer delete(Integer id) {
        return billsMapper.delete(id);
    }
}
