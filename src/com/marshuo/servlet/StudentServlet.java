package com.marshuo.servlet;

import com.marshuo.entity.Student;
import com.marshuo.entity.Subject;
import com.marshuo.pager.PageBean;
import com.marshuo.service.StudentService;
import com.marshuo.service.SubjectService;
import com.marshuo.utils.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/StudentServlet")
public class StudentServlet extends BaseServlet {
    private StudentService studentService = new StudentService();
    private SubjectService subjectService = new SubjectService();


    //按照姓名查找
    public String findByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        //获取当前页码
        String sCp = req.getParameter("currentPage");
        int cp = 1;
        if (sCp != null && !sCp.trim().isEmpty()) {
            cp = Integer.parseInt(sCp);
        }

        PageBean<Student> pb = null;
        try {
            pb = studentService.findByName(name, cp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("pb", pb);
        return "f:/teacher/studentManage.jsp";

    }

    //按照班级查找
    public String findByClass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String className = req.getParameter("className");
        //获取当前页码
        String sCp = req.getParameter("currentPage");
        int cp = 1;
        if (sCp != null && !sCp.trim().isEmpty()) {
            cp = Integer.parseInt(sCp);
        }

        PageBean<Student> pb = null;
        try {
            pb = studentService.findByClass(className, cp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("pb", pb);
        return "f:/teacher/studentManage.jsp";
    }

    //对提交测试结果，打分
    public String showPoint(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        //1. 获取学生信息
        Student student = (Student) req.getSession().getAttribute("studentInfo");

        //2. 获取试题的ID和answer
        //3.生成试题id的list，查找这些id对应的answer
        List<String> idList = new ArrayList<>();
        List<String> answerList = new ArrayList<>();
        for(int i=0; i< SubjectServlet.EXAM_COUNT; i++){
            String id = req.getParameter("id"+i);
            String answer = req.getParameter("answer"+i);
            idList.add(id);
            answerList.add(answer);
        }

        //4.比对学生提交的answer，得到测试结果
        int count = 0;
        try {
            count = subjectService.accountResult(idList, answerList);
        } catch (SQLException e) {
            e.printStackTrace();
            return "";
        }

        //5.更新测试结果到t_student
        student.setResult(count);
        studentService.updateExamResult(student);

        //6.显示测试结果给用户
        req.setAttribute("student", student);
        req.getSession().setAttribute("idList", idList);
        req.getSession().setAttribute("answerList", answerList);
        return "f:/student/examResult.jsp";
    }

    //对提交测试结果，打分
    public String showAnswer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        //1. 获取idList
        List<String> idList = (List<String>) req.getSession().getAttribute("idList");
        //2. 根据idList获取试题list（包括答案和解析）
        List<Subject> subjectList = subjectService.GetSubjectsByIdList(idList);

        req.setAttribute("subjectList", subjectList);
        return "f:/student/showAnswer.jsp";
    }

}
