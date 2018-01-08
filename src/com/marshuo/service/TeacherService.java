package com.marshuo.service;

import com.marshuo.dao.TeacherDao;
import com.marshuo.entity.Teacher;

import java.sql.SQLException;

public class TeacherService {
    private TeacherDao teacherDao = new TeacherDao();

    public boolean IsExist(Teacher teacher) throws SQLException {
        return teacherDao.IsExist(teacher);
    }
}
