package com.marshuo.dao;

import com.marshuo.entity.Subject;
import com.marshuo.pager.PageBean;
import com.marshuo.pager.PageConstants;
import com.marshuo.utils.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectDao {
    private QueryRunner qr = new TxQueryRunner();

    //载入所有试题
    public List<com.marshuo.entity.Subject> load() throws SQLException {
        String sql = "select * from t_subject";
        return qr.query(sql, new BeanListHandler<Subject>(com.marshuo.entity.Subject.class));
    }

    //分页载入试题
    public PageBean<Subject> load(int currPage) throws SQLException {
        //查找总记录数
        String countSql = "select count(*) from t_subject ";
        Number number = (Number) qr.query(countSql, new ScalarHandler());
        int count = number == null ?  0 : number.intValue();

        //每页记录数
        int pageRecords = PageConstants.SUBJECT_PAGE_SIZE;
        String sql = "select * from t_subject " + " limit ?, ?";
        Object[] params = {(currPage - 1) * pageRecords, pageRecords};

        System.out.println(sql);
        System.out.println(params);

        List<Subject> subjectList = qr.query(sql, new BeanListHandler<Subject>(Subject.class), params);
        PageBean<Subject>  pb = new PageBean<Subject>();
        pb.setTotalRecords(count);
        pb.setCurrentPage(currPage);
        pb.setPageRecords(pageRecords);
        pb.setDataList(subjectList);

        return pb;
    }

    //添加条目
    public boolean add(Subject subject) throws SQLException {

        String sql = "insert into t_subject (title, optionA, optionB, optionC, optionD, answer, parse) values (?,?,?,?,?,?,?)";

        Object[] params = {subject.getTitle(), subject.getOptionA(), subject.getOptionB(), subject.getOptionC(), subject.getOptionD(), subject.getAnswer(), subject.getParse()};

        return qr.update(sql, params)>0;
    }

    //通过ID查找
    public Subject findById(int id) throws SQLException {
        String sql = "select * from t_subject where id=?";
        return qr.query(sql, new BeanHandler<Subject>(Subject.class), id);
    }

    //更新
    public boolean update(Subject subject) throws SQLException {

        String sql = "update t_subject set title=?, optionA=?, optionB=?, optionC=?, optionD=?, answer=?, parse=? where id=?";

        Object[] params = {subject.getTitle(), subject.getOptionA(), subject.getOptionB(), subject.getOptionC(), subject.getOptionD(), subject.getAnswer(), subject.getParse(), subject.getId()};

        return qr.update(sql, params)>0;
    }

    //删除
    public boolean delete(int id) throws SQLException {
        String sql = "delete from t_subject where id=?";
        return qr.update(sql, id) > 0;
    }

    //通过标题查找
    public PageBean<Subject> findByTitle(String title, int currPage) throws SQLException {
        String whereSql = " where title like ?";

        List<Object> params = new ArrayList<Object>();

        //查找总记录数
        String countSql = "select count(*) from t_subject " + whereSql;
        params.add("%" + title + "%");
        Number number = (Number) qr.query(countSql, new ScalarHandler(), params.toArray());
        int count = number == null ?  0 : number.intValue();

        //每页记录数
        int pageRecords = PageConstants.SUBJECT_PAGE_SIZE;
        String sql = "select * from t_subject " + whereSql + " limit ?, ?";
        params.add( (currPage - 1) * pageRecords);
        params.add(pageRecords);

        System.out.println(sql);
        System.out.println(params);

        List<Subject> subjectList = qr.query(sql, new BeanListHandler<Subject>(Subject.class), params.toArray());
        PageBean<Subject>  pb = new PageBean<Subject>();
        pb.setTotalRecords(count);
        pb.setCurrentPage(currPage);
        pb.setPageRecords(pageRecords);
        pb.setDataList(subjectList);

        return pb;
    }


    //随机获取指定数目的试题
    public List<Subject> randomFindSubjects(int count) throws SQLException {
        String sql = "select * from t_subject order by rand()" + " limit ?";
        Object[] params = {count};

        System.out.println(sql);
        System.out.println(params);

        return qr.query(sql, new BeanListHandler<Subject>(Subject.class), params);
    }

    //通过一个ID列表来查找对应的试题
    public List<Subject> findByIdList(List<String> idList) throws SQLException {
        String sql = "select * from t_subject ";
        StringBuilder whereSql = new StringBuilder("where id in ");
        int count = idList.size();
        whereSql.append(" ( ");
        for (String id: idList ) {
            whereSql.append(id).append(",");
        }
        //删除最后一个逗号
        whereSql.deleteCharAt(whereSql.length()-1);
        whereSql.append(" ) ");

        sql += whereSql;
        System.out.println(sql);

        return qr.query(sql, new BeanListHandler<Subject>(Subject.class));
    }
}
