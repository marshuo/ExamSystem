package com.marshuo.servlet;

import com.marshuo.entity.Subject;
import com.marshuo.pager.PageBean;
import com.marshuo.service.SubjectService;
import com.marshuo.utils.BaseServlet;
import com.marshuo.utils.CommonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = "/SubjectServlet")
public class SubjectServlet extends BaseServlet {
    public static final int EXAM_COUNT = 20;//测试试题数

    private SubjectService subjectService = new SubjectService();


    //载入subject条目
    public String load(HttpServletRequest req, HttpServletResponse resp) throws ServletException, SQLException {

        //获取当前页码
        String sCp = req.getParameter("currentPage");
        int cp = 1;
        if (sCp != null && !sCp.trim().isEmpty()) {
            cp = Integer.parseInt(sCp);
        }

        PageBean<Subject> pb = subjectService.load(cp);
        req.setAttribute("pb", pb);
        return "f:/teacher/subjectManage.jsp";
    }


    public String add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Subject subject = CommonUtils.toBean(req.getParameterMap(), Subject.class);
        try {
            if (subjectService.add(subject)) {
                req.setAttribute("info", "试题录入成功");
                //return "f:/teacher/subjectInfo.jsp";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "f:/teacher/subjectAdd.jsp";
    }

    public String show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sId = req.getParameter("id");
        int id = 1;
        if (sId == null || sId.trim().isEmpty()){
            //显示错误信息
            System.out.println("id为空。。。");
        } else {
            id = Integer.parseInt(sId);
            try {
                Subject subject = subjectService.findById(id);
                req.setAttribute("subject", subject);
                return "f:/teacher/subjectShow.jsp";
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return "f:/teacher/subjectShow.jsp";
    }


    //预更新
    public String updatePre(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sId = req.getParameter("id");
        int id = 1;
        if (sId == null || sId.trim().isEmpty()){
            //显示错误信息
            System.out.println("id为空。。。");
        } else {
            id = Integer.parseInt(sId);
            try {
                Subject subject = subjectService.findById(id);
                req.setAttribute("subject", subject);
                return "f:/teacher/subjectUpdate.jsp";
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return "f:/teacher/subjectUpdate.jsp";
    }

    //更新
    public String update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Subject subject = CommonUtils.toBean(req.getParameterMap(), Subject.class);

        try {
            if (subjectService.update(subject)){
                return load(req, resp);
            } else {
                System.out.println("更新失败。。。");
                return "f:/teacher/subjectUpdate.jsp";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "f:/teacher/subjectUpdate.jsp";
    }

    //删除
    public String delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sId = req.getParameter("id");
        int id = 1;
        if (sId == null || sId.trim().isEmpty()){
            //显示错误信息
            System.out.println("id为空。。。");
        } else {
            id = Integer.parseInt(sId);
            try {
                subjectService.delete(id);
                return load(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return "f:/teacher/subjectManage.jsp";
    }

    //载入subject条目
    public String findByTitle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, SQLException {
        //获取当前页码
        String sCp = req.getParameter("currentPage");
        int cp = 1;
        if (sCp != null && !sCp.trim().isEmpty()) {
            cp = Integer.parseInt(sCp);
        }

        String title = req.getParameter("title");
        if (title == null || title.trim().isEmpty()){
            System.out.println("title为空");
            return "f:/teacher/subjectQuery.jsp";
        }

        PageBean<Subject> pb = subjectService.findByTitle(title, cp);

        req.setAttribute("pb", pb);
        return "f:/teacher/subjectManage.jsp";
    }

    //随机载入指定数目的试题
    public String randomFindSubjects(HttpServletRequest req, HttpServletResponse resp) throws ServletException, SQLException {

        List<Subject> subjectList = subjectService.randomFindSubjects(EXAM_COUNT);
        req.setAttribute("subjectList", subjectList);
        return "f:/student/index.jsp";
    }

}