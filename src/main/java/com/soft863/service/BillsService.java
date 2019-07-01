package com.soft863.service;

import com.soft863.bean.Bills;
import com.soft863.bean.QueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author lijunjie
 * @version 1.0
 * @date 2019/1/30 16:10
 */
public interface BillsService {

    public  List<Bills> queryAllBillsBy(QueryVo vo);

    /**
     * 查询总个数
     * @return
     */
    public Integer queryCount( QueryVo vo);

    /**
     * 插入账单
     * @param bills
     * @return
     */
    public Integer insertBills(Bills bills);

    /**
     * 通过Id查询账单
     * @param id
     * @return
     */
    public Bills queryBillsById(Integer id);

    /**
     * 修改账单
     * @param bills
     * @return
     */
    public Integer updateBills(Bills bills);

    /**
     * 删除账单
     * @param id
     * @return
     */
    public Integer delete(Integer id);


}
