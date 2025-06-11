<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息管理系统 - 新增学生</title>
    <!-- 引入Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入Font Awesome图标 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
            --form-bg: #ffffff;
        }

        body {
            background-color: var(--background-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .page-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background: linear-gradient(135deg, var(--primary-color), #2980b9);
            color: white;
            padding: 25px 0;
            border-radius: 8px 8px 0 0;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-card {
            background-color: var(--form-bg);
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 500;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }

        .form-control {
            border-color: #ddd;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }

        .btn-secondary {
            background-color: #f8f9fa;
            color: #6c757d;
            border-color: #ddd;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #e9ecef;
            color: #495057;
            border-color: #d1d5db;
        }

        .field-icon {
            position: absolute;
            right: 15px;
            top: 38px;
            color: #aaa;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .field-icon:hover {
            color: var(--primary-color);
        }

        .required::after {
            content: " *";
            color: var(--accent-color);
        }

        .success-message {
            display: none;
            background-color: rgba(46, 204, 113, 0.1);
            border-left: 4px solid var(--secondary-color);
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 0 4px 4px 0;
        }
    </style>
</head>
<body>
<div class="page-container">
    <div class="header">
        <h1 class="text-center mb-0"><i class="fas fa-user-plus mr-2"></i>新增学生信息</h1>
        <p class="text-center text-light-opacity">请填写以下信息以添加新学生</p>
    </div>

    <div class="form-card">
        <div class="success-message" id="successMessage">
            <strong><i class="fas fa-check-circle text-success mr-2"></i>操作成功!</strong> 学生信息已成功提交。
        </div>

        <form action="../InsertStudentservlet.do" method="post" id="studentForm" novalidate>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="form-group">
                        <label for="id" class="form-label required">学号</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                            <input type="text" class="form-control" id="id" name="id" required minlength="5" maxlength="10">
                            <div class="invalid-feedback">请输入有效的学号(5-10位)</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="form-group">
                        <label for="name" class="form-label required">姓名</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" id="name" name="name" required minlength="2" maxlength="20">
                            <div class="invalid-feedback">请输入姓名(2-20字)</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="form-group">
                        <label for="sex" class="form-label required">性别</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-gender-unknown"></i></span>
                            <select class="form-select" id="sex" name="sex" required>
                                <option value="">请选择性别</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                            <div class="invalid-feedback">请选择性别</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="form-group">
                        <label for="age" class="form-label required">年龄</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                            <input type="number" class="form-control" id="age" name="age" required min="10" max="50">
                            <div class="invalid-feedback">请输入有效的年龄(10-50岁)</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="form-group">
                        <label for="grade" class="form-label required">班级</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-graduation-cap"></i></span>
                            <input type="text" class="form-control" id="grade" name="grade" required>
                            <div class="invalid-feedback">请输入班级信息</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="form-group">
                        <label for="score" class="form-label required">成绩</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-clipboard-check"></i></span>
                            <input type="number" class="form-control" id="score" name="score" required min="0" max="100">
                            <div class="invalid-feedback">请输入有效的成绩(0-100分)</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary px-5 py-2"><i class="fas fa-save mr-2"></i>提交信息</button>
                <button type="reset" class="btn btn-secondary px-5 py-2 ml-3"><i class="fas fa-undo mr-2"></i>重置表单</button>
            </div>
        </form>
    </div>
</div>

<!-- 引入Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 表单验证
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('studentForm');

        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });

        // 为输入框添加焦点效果
        const inputs = form.querySelectorAll('input, select');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });

            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });
        });

        // 模拟提交成功后的提示
        form.addEventListener('submit', function() {
            const successMessage = document.getElementById('successMessage');
            successMessage.style.display = 'block';

            // 3秒后隐藏提示
            setTimeout(function() {
                successMessage.style.display = 'none';
            }, 3000);
        });
    });
</script>
</body>
</html>