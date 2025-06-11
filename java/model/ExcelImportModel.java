package model;

import entity.Student;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ExcelImportModel {

    public List<Student> parseExcel(InputStream inputStream) throws Exception {
        List<Student> studentList = new ArrayList<>();

        try (Workbook workbook = new XSSFWorkbook(inputStream)) {
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();

            // 跳过标题行
            if (rowIterator.hasNext()) {
                rowIterator.next();
            }

            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                Student student = new Student();

                // 学号 (整数)
                student.setId((int)getNumericCellValue(row.getCell(0)));

                // 姓名 (字符串)
                student.setName(getStringCellValue(row.getCell(1)));

                // 性别 (字符串)
                student.setSex(getStringCellValue(row.getCell(2)));

                // 班级 (字符串)
                student.setGrade(getStringCellValue(row.getCell(3)));

                // 年龄 (整数)
                student.setAge((int)getNumericCellValue(row.getCell(4)));

                // 成绩 (浮点数)
                student.setScore((float)getNumericCellValue(row.getCell(5)));

                // 验证必填字段
                if (student.getName() == null || student.getName().isEmpty()) {
                    throw new Exception("第" + (row.getRowNum()+1) + "行: 姓名不能为空");
                }

                studentList.add(student);
            }
        }

        if (studentList.isEmpty()) {
            throw new Exception("Excel文件中没有有效数据");
        }

        return studentList;
    }

    private String getStringCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }

        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue().trim();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue().toString();
                } else {
                    return String.valueOf((int) cell.getNumericCellValue());
                }
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                return cell.getStringCellValue();
            default:
                return "";
        }
    }

    private double getNumericCellValue(Cell cell) {
        if (cell == null) {
            return 0;
        }

        switch (cell.getCellType()) {
            case NUMERIC:
                return cell.getNumericCellValue();
            case STRING:
                try {
                    return Double.parseDouble(cell.getStringCellValue().trim());
                } catch (NumberFormatException e) {
                    return 0;
                }
            default:
                return 0;
        }
    }
}