package com.marshuo.service;

import com.marshuo.dao.StudentDao;
import com.marshuo.entity.Student;
import com.marshuo.pager.PageBean;

import java.sql.SQLException;

public class StudentService {
    private StudentDao studentDao = new StudentDao();

    public PageBean<Student> findByName(String name, int currPage) throws SQLException {
        return studentDao.findByName(name, currPage);
    }

    public PageBean<Student> findByClass(String className, int currPage) throws SQLException {
        return studentDao.findByClass(className, currPage);
    }

    public Student findByIdAndPassword(Student student) throws SQLException {
        return studentDao.findByNameAndPassword(student);
    }

    public boolean updateExamResult(Student student) throws SQLException {
        return studentDao.updateExamResult(student);
    }
}
