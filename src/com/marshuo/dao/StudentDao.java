package com.marshuo.dao;

import com.marshuo.entity.Student;
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

public class StudentDao {
    private QueryRunner qr = new TxQueryRunner();

    //通过name查找
    public PageBean<Student> findByName(String name, int currPage) throws SQLException {
        String whereSql = " where name like ?";

        List<Object> params = new ArrayList<Object>();

        //查找总记录数
        String countSql = "select count(*) from t_student " + whereSql;
        params.add("%" + name + "%");
        Number number = (Number) qr.query(countSql, new ScalarHandler(), params.toArray());
        int count = number == null ?  0 : number.intValue();

        //每页记录数
        int pageRecords = PageConstants.STUDENT_PAGE_SIZE;
        String sql = "select * from t_student " + whereSql + " limit ?, ?";
        params.add( (currPage - 1) * pageRecords);
        params.add(pageRecords);

        System.out.println(sql);
        System.out.println(params);

        List<Student> subjectList = qr.query(sql, new BeanListHandler<Student>(Student.class), params.toArray());
        PageBean<Student>  pb = new PageBean<Student>();
        pb.setTotalRecords(count);
        pb.setCurrentPage(currPage);
        pb.setPageRecords(pageRecords);
        pb.setDataList(subjectList);

        return pb;
    }

    //通过班级查找
    public PageBean<Student> findByClass(String className, int currPage) throws SQLException {
        String whereSql = " where sclass like ?";

        List<Object> params = new ArrayList<Object>();

        //查找总记录数
        String countSql = "select count(*) from t_student " + whereSql;
        params.add("%" + className + "%");
        Number number = (Number) qr.query(countSql, new ScalarHandler(), params.toArray());
        int count = number == null ?  0 : number.intValue();

        //每页记录数
        int pageRecords = PageConstants.STUDENT_PAGE_SIZE;
        String sql = "select * from t_student " + whereSql + " limit ?, ?";
        params.add( (currPage - 1) * pageRecords);
        params.add(pageRecords);

        System.out.println(sql);
        System.out.println(params);

        List<Student> subjectList = qr.query(sql, new BeanListHandler<Student>(Student.class), params.toArray());
        PageBean<Student>  pb = new PageBean<Student>();
        pb.setTotalRecords(count);
        pb.setCurrentPage(currPage);
        pb.setPageRecords(pageRecords);
        pb.setDataList(subjectList);

        return pb;
    }

    //根据name和password查找
    public Student findByNameAndPassword(Student student) throws SQLException {
        //where BINARY，让查询区分大小写
        String sql = "select * from t_student where BINARY name=? and BINARY password=?";
        Object[] param = {student.getName(), student.getPassword()};
        return qr.query(sql, new BeanHandler<Student>(Student.class), param);
    }

    //更新测试成绩
    public boolean updateExamResult(Student student) throws SQLException {
        //where BINARY，让查询区分大小写
        String sql = "update t_student set result = ? where BINARY id = ?";
        Object[] param = {student.getResult(), student.getId()};
        return qr.update(sql, param) > 0;
    }

}
