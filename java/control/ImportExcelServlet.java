package control;

import entity.Student;
import model.ExcelImportModel;
import model.StudentModel;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

public class ImportExcelServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {

        try {
            // 检查是否是multipart表单数据
            if (!ServletFileUpload.isMultipartContent(request)) {
                throw new Exception("表单必须包含enctype=multipart/form-data");
            }

            // 创建文件上传处理器
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            // 设置上传参数
            upload.setSizeMax(10 * 1024 * 1024); // 10MB限制

            // 解析请求
            List<FileItem> items = upload.parseRequest(request);
            InputStream fileContent = null;
            String fileName = null;

            // 遍历表单项
            for (FileItem item : items) {
                if (!item.isFormField() && "excelFile".equals(item.getFieldName())) {
                    fileName = item.getName();
                    fileContent = item.getInputStream();
                    break;
                }
            }

            // 验证文件
            if (fileName == null || !fileName.toLowerCase().endsWith(".xlsx")) {
                throw new Exception("只支持Excel 2007+文件(.xlsx)");
            }

            if (fileContent == null) {
                throw new Exception("上传的文件为空");
            }

            // 解析Excel文件
            ExcelImportModel excelModel = new ExcelImportModel();
            List<Student> students = excelModel.parseExcel(fileContent);

            // 批量插入数据库
            StudentModel studentModel = new StudentModel();
            int successCount = 0;
            int failCount = 0;
            StringBuilder errorMessages = new StringBuilder();

            for (Student student : students) {
                try {
                    if (studentModel.insert(
                            student.getId(),
                            student.getName(),
                            student.getSex(),
                            student.getAge(),
                            student.getGrade(),
                            student.getScore())) {
                        successCount++;
                    } else {
                        failCount++;
                        errorMessages.append("学号 ").append(student.getId()).append(" 插入失败; ");
                    }
                } catch (Exception e) {
                    failCount++;
                    errorMessages.append("学号 ").append(student.getId())
                            .append(" 错误: ").append(e.getMessage()).append("; ");
                }
            }

            // 设置结果信息
            request.setAttribute("successCount", successCount);
            request.setAttribute("failCount", failCount);
            request.setAttribute("totalCount", students.size());

            if (failCount > 0) {
                request.setAttribute("errorMessages", errorMessages.toString());
            }

            // 跳转到结果页面
            request.getRequestDispatcher("/jsp/import_result.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "导入失败: " + e.getMessage());
            request.getRequestDispatcher("/jsp/import.jsp").forward(request, response);
        }
    }
}