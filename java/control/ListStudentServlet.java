package control;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StudentModel;

public class ListStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // 强制清除旧属性
        request.removeAttribute("editMode");
        request.removeAttribute("deleteMode");

        if("edit".equals(action)) {
            request.setAttribute("editMode", "true"); // 改为字符串类型
        }
        else if("delete".equals(action)) {
            request.setAttribute("deleteMode", "true"); // 改为字符串类型
        }

        // 调试输出
        System.out.println("[DEBUG] 设置属性: " +
                "editMode=" + request.getAttribute("editMode") +
                ", deleteMode=" + request.getAttribute("deleteMode"));

        // 获取数据并转发
        StudentModel model = new StudentModel();
        request.setAttribute("studentlist", model.search());
        request.getRequestDispatcher("/jsp/studentlist.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}