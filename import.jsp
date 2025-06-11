<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息管理系统 - 批量导入</title>
    <!-- 引入Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- 引入Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 配置Tailwind主题 -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#3B82F6', // 蓝色主色调
                        secondary: '#10B981', // 绿色辅助色
                        accent: '#F59E0B', // 橙色强调色
                        neutral: '#6B7280', // 中性色
                        danger: '#EF4444', // 红色错误色
                    },
                    fontFamily: {
                        sans: ['Inter', 'system-ui', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .card-shadow {
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            }
            .card-hover {
                transition: all 0.3s ease;
            }
            .card-hover:hover {
                transform: translateY(-5px);
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            }
            .btn-transition {
                transition: all 0.2s ease;
            }
            .btn-transition:hover {
                transform: translateY(-2px);
            }
            .progress-bar {
                transition: width 0.5s ease-in-out;
            }
            .upload-area {
                transition: all 0.3s ease;
            }
            .upload-area:hover {
                background-color: rgba(59, 130, 246, 0.05);
                border-color: rgba(59, 130, 246, 0.5);
            }
            .upload-area.drag-over {
                background-color: rgba(59, 130, 246, 0.1);
                border-color: rgba(59, 130, 246, 0.8);
                transform: translateY(-3px);
            }
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
<!-- 顶部导航 -->
<header class="bg-white shadow-sm sticky top-0 z-10">
    <div class="container mx-auto px-4 py-3 flex items-center justify-between">
        <div class="flex items-center space-x-2">
            <i class="fa fa-graduation-cap text-primary text-2xl"></i>
            <h1 class="text-xl font-bold text-gray-800">学生信息管理系统</h1>
        </div>
        <nav>
            <ul class="flex space-x-6">
                <li><a href="../ListStudentServlet.do" class="text-gray-600 hover:text-primary transition-colors"><i class="fa fa-list mr-1"></i>学生列表</a></li>
                <li><a href="#" class="text-primary font-medium border-b-2 border-primary pb-1"><i class="fa fa-upload mr-1"></i>批量导入</a></li>
                <li><a href="#" class="text-gray-600 hover:text-primary transition-colors"><i class="fa fa-cog mr-1"></i>系统设置</a></li>
            </ul>
        </nav>
    </div>
</header>

<!-- 主要内容 -->
<main class="flex-grow container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <!-- 页面标题 -->
        <div class="mb-8 text-center">
            <h2 class="text-[clamp(1.8rem,3vw,2.5rem)] font-bold text-gray-800 mb-2">批量导入学生信息</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">上传Excel文件，快速批量导入学生数据，提高工作效率</p>
        </div>

        <!-- 错误消息 -->
        <c:if test="${not empty error}">
            <div class="bg-red-50 border border-red-200 text-red-700 p-4 rounded-lg mb-6 flex items-start">
                <i class="fa fa-exclamation-circle text-red-500 mt-1 mr-3"></i>
                <div>
                    <h4 class="font-medium">导入失败</h4>
                    <p>${error}</p>
                </div>
            </div>
        </c:if>

        <!-- 上传表单卡片 -->
        <div class="bg-white rounded-xl shadow-lg p-6 md:p-8 mb-8 card-shadow card-hover">
            <div class="mb-6">
                <h3 class="text-xl font-semibold text-gray-800 mb-2 flex items-center">
                    <i class="fa fa-cloud-upload text-primary mr-2"></i>选择Excel文件
                </h3>
                <p class="text-gray-500">支持的格式: .xlsx</p>
            </div>

            <form action="../ImportExcelServlet.do" method="post" enctype="multipart/form-data" id="importForm">
                <!-- 拖拽上传区域 -->
                <div id="uploadArea" class="upload-area border-2 border-dashed border-gray-300 rounded-lg p-8 text-center mb-6 cursor-pointer">
                    <i class="fa fa-file-excel-o text-4xl text-primary mb-4"></i>
                    <h4 class="text-lg font-medium text-gray-700 mb-2">拖放Excel文件到此处</h4>
                    <p class="text-gray-500 mb-4">或点击选择文件</p>
                    <input type="file" name="excelFile" accept=".xlsx" required class="hidden" id="fileInput">
                    <button type="button" class="bg-primary hover:bg-primary/90 text-white font-medium py-2 px-6 rounded-lg btn-transition inline-flex items-center">
                        <i class="fa fa-plus mr-2"></i>选择文件
                    </button>
                </div>

                <!-- 已选择的文件信息 -->
                <div id="fileInfo" class="hidden mb-6 bg-gray-50 p-4 rounded-lg">
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <i class="fa fa-file-excel-o text-primary mr-3 text-xl"></i>
                            <div>
                                <h4 id="fileName" class="font-medium text-gray-800"></h4>
                                <p id="fileSize" class="text-sm text-gray-500"></p>
                            </div>
                        </div>
                        <button type="button" id="removeFile" class="text-gray-400 hover:text-danger">
                            <i class="fa fa-times-circle text-xl"></i>
                        </button>
                    </div>
                    <!-- 进度条 -->
                    <div class="mt-3">
                        <div class="h-2 w-full bg-gray-200 rounded-full overflow-hidden">
                            <div id="uploadProgress" class="progress-bar h-full bg-primary" style="width: 0%"></div>
                        </div>
                    </div>
                </div>

                <!-- 操作按钮 -->
                <div class="flex flex-col sm:flex-row justify-between items-center gap-4">
                    <button type="submit" id="submitBtn" class="w-full sm:w-auto bg-primary hover:bg-primary/90 text-white font-medium py-3 px-8 rounded-lg btn-transition inline-flex items-center justify-center disabled:opacity-50 disabled:cursor-not-allowed">
                        <i class="fa fa-upload mr-2"></i>开始导入
                    </button>
                    <a href="../ListStudentServlet.do" class="w-full sm:w-auto bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-3 px-8 rounded-lg btn-transition inline-flex items-center justify-center">
                        <i class="fa fa-arrow-left mr-2"></i>返回列表
                    </a>
                </div>
            </form>
        </div>

        <!-- 导入指南卡片 -->
        <div class="bg-white rounded-xl shadow-lg p-6 md:p-8 card-shadow card-hover">
            <h3 class="text-xl font-semibold text-gray-800 mb-4 flex items-center">
                <i class="fa fa-info-circle text-accent mr-2"></i>Excel文件格式要求
            </h3>

            <div class="overflow-x-auto">
                <table class="w-full min-w-[640px]">
                    <thead>
                    <tr class="bg-gray-50">
                        <th class="py-3 px-4 text-left font-medium text-gray-700 rounded-tl-lg">列顺序</th>
                        <th class="py-3 px-4 text-left font-medium text-gray-700">字段名称</th>
                        <th class="py-3 px-4 text-left font-medium text-gray-700">数据类型</th>
                        <th class="py-3 px-4 text-left font-medium text-gray-700">是否必填</th>
                        <th class="py-3 px-4 text-left font-medium text-gray-700 rounded-tr-lg">示例</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
                        <td class="py-3 px-4 font-medium text-primary">1</td>
                        <td class="py-3 px-4">学号</td>
                        <td class="py-3 px-4">整数</td>
                        <td class="py-3 px-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">必填</span></td>
                        <td class="py-3 px-4">1001</td>
                    </tr>
                    <tr class="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
                        <td class="py-3 px-4 font-medium text-primary">2</td>
                        <td class="py-3 px-4">姓名</td>
                        <td class="py-3 px-4">字符串</td>
                        <td class="py-3 px-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">必填</span></td>
                        <td class="py-3 px-4">张三</td>
                    </tr>
                    <tr class="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
                        <td class="py-3 px-4 font-medium text-primary">3</td>
                        <td class="py-3 px-4">性别</td>
                        <td class="py-3 px-4">字符串</td>
                        <td class="py-3 px-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">必填</span></td>
                        <td class="py-3 px-4">男/女</td>
                    </tr>
                    <tr class="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
                        <td class="py-3 px-4 font-medium text-primary">4</td>
                        <td class="py-3 px-4">班级</td>
                        <td class="py-3 px-4">字符串</td>
                        <td class="py-3 px-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">必填</span></td>
                        <td class="py-3 px-4">计算机1班</td>
                    </tr>
                    <tr class="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
                        <td class="py-3 px-4 font-medium text-primary">5</td>
                        <td class="py-3 px-4">年龄</td>
                        <td class="py-3 px-4">整数</td>
                        <td class="py-3 px-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">必填</span></td>
                        <td class="py-3 px-4">20</td>
                    </tr>
                    <tr class="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
                        <td class="py-3 px-4 font-medium text-primary">6</td>
                        <td class="py-3 px-4">成绩</td>
                        <td class="py-3 px-4">浮点数</td>
                        <td class="py-3 px-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">必填</span></td>
                        <td class="py-3 px-4">85.5</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="mt-6 bg-blue-50 border-l-4 border-primary p-4 rounded-r-lg">
                <div class="flex">
                    <div class="flex-shrink-0">
                        <i class="fa fa-lightbulb-o text-primary"></i>
                    </div>
                    <div class="ml-3">
                        <h4 class="text-sm font-medium text-primary">导入注意事项</h4>
                        <div class="mt-2 text-sm text-blue-700 space-y-2">
                            <p>• 第一行应为标题行，系统会自动跳过</p>
                            <p>• 请确保所有必填字段都有值</p>
                            <p>• 导入过程中请勿刷新页面</p>
                            <p>• 导入成功后，将自动跳转到学生列表页面</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- 页脚 -->
<footer class="bg-gray-800 text-white py-6 mt-12">
    <div class="container mx-auto px-4">
        <div class="flex flex-col md:flex-row justify-between items-center">
            <div class="mb-4 md:mb-0">
                <p class="text-sm text-gray-400">&copy; 2023 学生信息管理系统 | 版权所有</p>
            </div>
            <div class="flex space-x-6">
                <a href="#" class="text-gray-400 hover:text-white transition-colors">
                    <i class="fa fa-question-circle"></i> 帮助中心
                </a>
                <a href="#" class="text-gray-400 hover:text-white transition-colors">
                    <i class="fa fa-shield"></i> 隐私政策
                </a>
                <a href="#" class="text-gray-400 hover:text-white transition-colors">
                    <i class="fa fa-file-text-o"></i> 使用条款
                </a>
            </div>
        </div>
    </div>
</footer>

<!-- JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const uploadArea = document.getElementById('uploadArea');
        const fileInput = document.getElementById('fileInput');
        const fileInfo = document.getElementById('fileInfo');
        const fileName = document.getElementById('fileName');
        const fileSize = document.getElementById('fileSize');
        const removeFile = document.getElementById('removeFile');
        const submitBtn = document.getElementById('submitBtn');
        const uploadProgress = document.getElementById('uploadProgress');
        const importForm = document.getElementById('importForm');

        // 点击上传区域触发文件选择
        uploadArea.addEventListener('click', function() {
            fileInput.click();
        });

        // 文件选择改变时更新文件信息
        fileInput.addEventListener('change', function(e) {
            if (this.files && this.files[0]) {
                const file = this.files[0];
                updateFileInfo(file);
            }
        });

        // 拖放功能
        uploadArea.addEventListener('dragover', function(e) {
            e.preventDefault();
            this.classList.add('drag-over');
        });

        uploadArea.addEventListener('dragleave', function() {
            this.classList.remove('drag-over');
        });

        uploadArea.addEventListener('drop', function(e) {
            e.preventDefault();
            this.classList.remove('drag-over');

            if (e.dataTransfer.files.length) {
                const file = e.dataTransfer.files[0];
                if (file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
                    fileInput.files = e.dataTransfer.files;
                    updateFileInfo(file);
                } else {
                    showToast('请上传.xlsx格式的Excel文件', 'error');
                }
            }
        });

        // 移除已选择的文件
        removeFile.addEventListener('click', function() {
            fileInput.value = '';
            fileInfo.classList.add('hidden');
            uploadArea.classList.remove('hidden');
            submitBtn.disabled = true;
        });

        // 更新文件信息
        function updateFileInfo(file) {
            fileName.textContent = file.name;
            fileSize.textContent = formatFileSize(file.size);
            fileInfo.classList.remove('hidden');
            uploadArea.classList.add('hidden');
            submitBtn.disabled = false;
        }

        // 格式化文件大小
        function formatFileSize(bytes) {
            if (bytes === 0) return '0 Bytes';
            const k = 1024;
            const sizes = ['Bytes', 'KB', 'MB'];
            const i = Math.floor(Math.log(bytes) / Math.log(k));
            return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
        }

        // 表单提交处理
        importForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // 显示进度条动画
            let progress = 0;
            const interval = setInterval(() => {
                progress += Math.random() * 10;
                if (progress >= 90) {
                    progress = 90;
                    clearInterval(interval);
                }
                uploadProgress.style.width = `${progress}%`;
            }, 300);

            // 模拟表单提交
            setTimeout(() => {
                this.submit();
            }, 1000);
        });

        // 显示提示消息
        function showToast(message, type = 'success') {
            // 简单实现，实际项目中可以使用更完善的toast组件
            alert(message);
        }
    });
</script>
</body>
</html>