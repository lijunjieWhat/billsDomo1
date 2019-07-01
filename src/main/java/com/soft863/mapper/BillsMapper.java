package com.soft863.mapper;

import com.soft863.bean.Bills;
import com.soft863.bean.QueryVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillsMapper {

    /**
     * 根据条件查询
     * @param vo
     * @return
     */
    public List<Bills> queryAllBillsBy(QueryVo vo);

    /**
     * 查询总个数
     * @return
     */
    public Integer queryCount(QueryVo vo);

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
