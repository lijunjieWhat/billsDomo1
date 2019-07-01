package com.soft863.controller;


import com.soft863.bean.Bills;
import com.soft863.bean.BillsType;
import com.soft863.bean.QueryVo;
import com.soft863.service.BillsService;
import com.soft863.utils.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("bills")
public class BillsController {

    @Autowired
    private BillsService billsService;

    /**
     * 根据条件查询
     *
     * @param model
     * @param vo
     * @param currentPage
     * @return
     */
    @RequestMapping("index")
    public String queryAllBillsBy(Integer typeid,HttpServletRequest request, Model model, QueryVo vo, Integer currentPage) {
        System.out.println(typeid);
        //分页开始
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = 1;
        }
        if (typeid != null){
            BillsType b = new BillsType();
            b.setId(typeid);
            vo.setBillsType(b);
        }
            vo = new QueryVo(vo.getStartDate(), vo.getEndDate(), vo.getBillsType(), currentPage, 5, billsService.queryCount(vo));

        if (vo.getBillsType() != null && vo.getBillsType().getId() == 0) {
            vo.setBillsType(null);
        }

        System.out.println(vo.getStart());
        System.out.println(vo.getEnd());
        List<Bills> list = billsService.queryAllBillsBy(vo);
        model.addAttribute("list", list);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalpage", vo.getTotalPage());
        System.out.println(vo);
        request.getSession().setAttribute("vo", vo);
        return "bills";
    }


    //    记账
    @RequestMapping("add")
    public String add() {
        return "add";
    }

    /**
     * 插入
     *
     * @param bills
     * @return
     */
    @RequestMapping("insert")
    @ResponseBody
    public String insertBills(Bills bills) {
        String msg = "1";
        bills.setDate(Date.date());
        Integer integer = billsService.insertBills(bills);
        if (integer != null) {
            msg = "0";
        }
        return msg;

    }


    /**
     * 通过Id查询账单
     *
     * @param id
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Bills queryBillsById(Integer id) {
        return billsService.queryBillsById(id);
    }

    @RequestMapping("update")
    @ResponseBody
    public String updateBills(Bills bills) {
        String msg = "1";
        Integer integer = billsService.updateBills(bills);
        if (integer != null) {
            msg = "0";
        }
        return msg;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id){
        String msg = "1";
        Integer integer = billsService.delete(id);
        if (integer != null) {
            msg = "0";
        }
        return msg;
    }
}
