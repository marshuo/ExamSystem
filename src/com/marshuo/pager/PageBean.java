package com.marshuo.pager;

import java.util.List;

public class PageBean<T> {
    private int pageRecords;// 每页记录数
    private int totalRecords; //总记录数
    private int currentPage; //当前页数;
    private List<T> dataList;
    private String url; //给页面传递url

    //计算总页数
    public int getTotalPages () {
        int tp = totalRecords / pageRecords;
        return totalRecords % pageRecords == 0? tp : tp+1;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public int getPageRecords() {
        return pageRecords;
    }

    public void setPageRecords(int pageRecords) {
        this.pageRecords = pageRecords;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "pageRecords=" + pageRecords +
                ", totalRecords=" + totalRecords +
                ", currentPage=" + currentPage +
                ", dataList=" + dataList +
                ", url='" + url + '\'' +
                '}';
    }
}
