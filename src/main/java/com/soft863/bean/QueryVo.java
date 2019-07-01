package com.soft863.bean;

public class QueryVo {

    private String startDate;
    private String endDate;
    private BillsType billsType;
    private int currentPage;//当前页
    private int pageSize;//一页内有的条数
    private int total;//总记录数
    private int totalPage;//总页码
    private int start;//开始位置
    private int end;


    public QueryVo() {
    }



    public QueryVo(String startDate, String endDate, BillsType billsType, int currentPage, int pageSize, int total) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.billsType = billsType;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.total = total;
        this.start = (currentPage - 1) * pageSize;
        this.end = pageSize;
        this.totalPage = total%pageSize == 0 ? total/pageSize : total/pageSize+1;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public BillsType getBillsType() {
        return billsType;
    }

    public void setBillsType(BillsType billsType) {
        this.billsType = billsType;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "QueryVo{" +
                "startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", billsType=" + billsType +
                ", currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", total=" + total +
                ", totalPage=" + totalPage +
                ", start=" + start +
                ", end=" + end +
                '}';
    }
}
