package com.marshuo.service;

import com.marshuo.dao.SubjectDao;
import com.marshuo.entity.Subject;
import com.marshuo.pager.PageBean;

import java.sql.SQLException;
import java.util.List;

public class SubjectService {
    private SubjectDao subjectDao = new SubjectDao();



    public PageBean<Subject> load(int currPage) throws SQLException {
        return subjectDao.load(currPage);
    }

    public boolean add(Subject subject) throws SQLException {
        return subjectDao.add(subject);
    }

    public Subject findById(int id) throws SQLException {
        return subjectDao.findById(id);
    }

    public boolean update(Subject subject) throws SQLException {
        return subjectDao.update(subject);
    }

    public boolean delete(int id) throws SQLException {
        return subjectDao.delete(id);
    }

    public PageBean<Subject> findByTitle(String title, int currPage) throws SQLException {
        return subjectDao.findByTitle(title, currPage);
    }

    public List<Subject> randomFindSubjects(int count) throws SQLException {
        return subjectDao.randomFindSubjects(count);
    }

    //根据ID列表和answer列表计算测试结果
    public int accountResult(List<String> idList, List<String> answerList ) throws SQLException {
        //todo: 注意可能的问题，数据库返回的subject是否和idList中的id顺序一致。
        List<Subject> subjectList = subjectDao.findByIdList(idList);
        int count = 0;
        for(int i=0; i<subjectList.size(); i++){
            String answer = answerList.get(i);
            String rightAnswer = subjectList.get(i).getAnswer();
            if (answer != null && rightAnswer != null && answer.equals(rightAnswer)){
                count += 5;
            }
        }

        return count;
    }

    //根据ID列表获取对应的试题信息
    public List<Subject> GetSubjectsByIdList(List<String> idList) throws SQLException {
        return subjectDao.findByIdList(idList);
    }
}
