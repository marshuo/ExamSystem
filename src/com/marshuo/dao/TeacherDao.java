package com.marshuo.dao;

import com.marshuo.entity.Teacher;
import com.marshuo.utils.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;

public class TeacherDao {
    private QueryRunner qr = new TxQueryRunner();

    //判断用户是否存在
    public boolean IsExist(Teacher teacher) throws SQLException {
        //where BINARY，让查询区分大小写
        String sql = "select count(*) from t_teacher where BINARY id=? and BINARY password=?";
        Object[] param = {teacher.getId(), teacher.getPassword()};
        Number number = (Number)qr.query(sql, new ScalarHandler(), param);
        return number.intValue()>0;
    }
}
