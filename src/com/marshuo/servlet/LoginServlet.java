package com.marshuo.servlet;

import com.marshuo.entity.Student;
import com.marshuo.entity.Teacher;
import com.marshuo.service.StudentService;
import com.marshuo.service.TeacherService;
import com.marshuo.utils.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends BaseServlet{
    private TeacherService teacherService = new TeacherService();
    private StudentService studentService = new StudentService();

    //用户登录
    public String login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("login...");
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        System.out.println("id=" + id);
        System.out.println("password=" + password);
        System.out.println("role=" + role);

        //验证id,password,role是否为空
        if (id == null || id.isEmpty() ) {
            req.setAttribute("error", "用户名或密码不能为空");
            return "/login.jsp";
        }

        if (password == null || password.isEmpty() ) {
            req.setAttribute("error", "用户名或密码不能为空");
            return "/login.jsp";
        }

        if (role == null || role.isEmpty() ) {
            req.setAttribute("error", "用户名或密码不能为空");
            return "/login.jsp";
        }


        if ("teacher".equals(role)) {
            Teacher teacher = new Teacher();
            teacher.setId(id);
            teacher.setPassword(password);
            try {
                if (teacherService.IsExist(teacher)){
                    //保存用户id到session
                    req.getSession().setAttribute("id", id);
                    return "r:/teacher/index.jsp";
                } else {
                    req.setAttribute("error", "用户名或密码错误");
                    return "/login.jsp";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                return "error.jsp";
            }
        } else if ("student".equals(role)) {
            Student student = new Student();
            student.setName(id);
            student.setPassword(password);

            try {
                student = studentService.findByIdAndPassword(student);
                if (student != null){
                    req.getSession().setAttribute("studentInfo", student);
                    return "/SubjectServlet?method=randomFindSubjects";
                }
                else {
                    req.setAttribute("error", "用户名或密码错误");
                    return "/login.jsp";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return "/login.jsp";
    }

    //用户登出
    public String logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        return "/login.jsp";
    }
}
