<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>学生信息管理系统</title>
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .card-shadow {
                box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.03);
            }
            .card-hover {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .card-hover:hover {
                transform: translateY(-5px);
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.05);
            }
            .gradient-bg {
                background: linear-gradient(135deg, #f5f7fa 0%, #e4e7eb 100%);
            }
            .glass-effect {
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.2);
            }
            .animate-fade-in {
                animation: fadeIn 0.5s ease-in-out;
            }
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }
        }
    </style>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#3B82F6',
                        secondary: '#1E40AF',
                        accent: '#60A5FA',
                        success: '#10B981',
                        warning: '#F59E0B',
                        danger: '#EF4444',
                        management: '#4B5563',
                        import: '#06B6D4',
                        light: '#F8FAFC',
                        dark: '#1E293B'
                    },
                    fontFamily: {
                        inter: ['Inter', 'system-ui', 'sans-serif'],
                    },
                }
            }
        }
    </script>
</head>
<body class="font-inter gradient-bg min-h-screen flex flex-col">
<!-- 导航栏 -->
<header class="bg-white/90 backdrop-blur-md shadow-sm sticky top-0 z-50 transition-all duration-300">
    <div class="container mx-auto px-4 py-3 flex items-center justify-between">
        <div class="flex items-center space-x-2">
            <i class="fa fa-graduation-cap text-primary text-2xl"></i>
            <h1 class="text-xl md:text-2xl font-bold text-dark">学生信息管理系统</h1>
        </div>
        <nav class="hidden md:flex items-center space-x-6">
            <a href="#" class="text-primary font-medium hover:text-secondary transition-colors">首页</a>
            <a href="ListStudentServlet.do" class="text-dark/70 hover:text-primary transition-colors">学生列表</a>
            <a href="jsp/studentinsert.jsp" class="text-dark/70 hover:text-primary transition-colors">新增学生</a>
            <a href="jsp/import.jsp" class="text-dark/70 hover:text-primary transition-colors">数据导入</a>
        </nav>
        <button class="md:hidden text-dark text-xl">
            <i class="fa fa-bars"></i>
        </button>
    </div>
</header>

<!-- 主内容区 -->
<main class="flex-grow container mx-auto px-4 py-8">
    <!-- 欢迎信息 -->
    <section class="mb-12 text-center animate-fade-in">
        <div class="max-w-3xl mx-auto">
            <h2 class="text-[clamp(1.8rem,4vw,2.8rem)] font-bold text-dark mb-4 leading-tight">
                欢迎使用学生信息管理系统
            </h2>
            <p class="text-dark/70 text-lg md:text-xl mb-6">
                这是一个功能完善的管理平台，可以帮助您高效管理学生信息数据
            </p>
            <div class="flex flex-col sm:flex-row justify-center gap-4">
                <a href="ListStudentServlet.do" class="bg-primary hover:bg-secondary text-white font-medium py-3 px-6 rounded-lg transition-all duration-300 shadow-lg hover:shadow-xl">
                    <i class="fa fa-list mr-2"></i>查看学生列表
                </a>
                <a href="jsp/studentinsert.jsp" class="bg-white hover:bg-gray-50 text-primary border border-primary font-medium py-3 px-6 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg">
                    <i class="fa fa-plus mr-2"></i>新增学生
                </a>
            </div>
        </div>
    </section>

    <!-- 功能卡片 -->
    <section class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <!-- 学生信息管理卡片 -->
        <div class="bg-white rounded-xl overflow-hidden card-shadow card-hover animate-fade-in" style="animation-delay: 0.1s">
            <div class="h-2 bg-gradient-to-r from-primary to-accent"></div>
            <div class="p-6">
                <div class="flex items-start justify-between mb-4">
                    <div>
                        <h3 class="text-xl font-bold text-dark mb-1">学生信息管理</h3>
                        <p class="text-dark/60">全面管理学生信息数据</p>
                    </div>
                    <div class="w-14 h-14 rounded-full bg-primary/10 flex items-center justify-center">
                        <i class="fa fa-users text-2xl text-primary"></i>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-3 mt-6">
                    <a href="ListStudentServlet.do" class="bg-blue-50 hover:bg-blue-100 text-primary p-3 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-eye mr-2"></i> 查看信息
                    </a>
                    <a href="jsp/studentinsert.jsp" class="bg-green-50 hover:bg-green-100 text-success p-3 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-plus mr-2"></i> 新增学生
                    </a>
                    <a href="ListStudentServlet.do?action=edit" class="bg-yellow-50 hover:bg-yellow-100 text-warning p-3 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-pencil mr-2"></i> 修改信息
                    </a>
                    <a href="ListStudentServlet.do?action=delete" class="bg-red-50 hover:bg-red-100 text-danger p-3 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-trash mr-2"></i> 删除信息
                    </a>
                </div>
            </div>
        </div>

        <!-- 数据导入卡片 -->
        <div class="bg-white rounded-xl overflow-hidden card-shadow card-hover animate-fade-in" style="animation-delay: 0.2s">
            <div class="h-2 bg-gradient-to-r from-import to-teal-400"></div>
            <div class="p-6">
                <div class="flex items-start justify-between mb-4">
                    <div>
                        <h3 class="text-xl font-bold text-dark mb-1">数据批量导入</h3>
                        <p class="text-dark/60">通过Excel文件批量导入学生数据</p>
                    </div>
                    <div class="w-14 h-14 rounded-full bg-import/10 flex items-center justify-center">
                        <i class="fa fa-file-excel-o text-2xl text-import"></i>
                    </div>
                </div>
                <div class="mt-6">
                    <a href="jsp/import.jsp" class="w-full bg-import hover:bg-teal-500 text-white font-medium py-3 px-4 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-upload mr-2"></i> 导入Excel文件
                    </a>
                </div>
                <div class="mt-4 p-3 bg-gray-50 rounded-lg">
                    <p class="text-sm text-dark/60">
                        <i class="fa fa-info-circle text-import mr-1"></i>
                        支持批量导入学生信息，文件格式为XLS或XLSX
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- 系统功能介绍 -->
    <section class="mt-16 animate-fade-in" style="animation-delay: 0.3s">
        <h3 class="text-2xl font-bold text-center mb-10 text-dark">系统功能</h3>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-white p-5 rounded-lg shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center mb-4">
                    <i class="fa fa-database text-primary"></i>
                </div>
                <h4 class="text-lg font-semibold mb-2 text-dark">数据管理</h4>
                <p class="text-dark/60">
                    全面管理学生基本信息，包括添加、修改、删除和查询功能
                </p>
            </div>
            <div class="bg-white p-5 rounded-lg shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 rounded-full bg-green-100 flex items-center justify-center mb-4">
                    <i class="fa fa-file-excel-o text-success"></i>
                </div>
                <h4 class="text-lg font-semibold mb-2 text-dark">批量导入</h4>
                <p class="text-dark/60">
                    通过Excel文件批量导入学生数据，提高数据录入效率
                </p>
            </div>
            <div class="bg-white p-5 rounded-lg shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 rounded-full bg-purple-100 flex items-center justify-center mb-4">
                    <i class="fa fa-bar-chart text-purple-500"></i>
                </div>
                <h4 class="text-lg font-semibold mb-2 text-dark">数据统计</h4>
                <p class="text-dark/60">
                    提供学生数据统计分析功能，支持多维度数据查看
                </p>
            </div>
        </div>
    </section>
</main>

<!-- 页脚 -->
<footer class="bg-dark text-white py-8 mt-16">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div>
                <h4 class="text-lg font-semibold mb-4 flex items-center">
                    <i class="fa fa-graduation-cap mr-2"></i> 学生信息管理系统
                </h4>
                <p class="text-gray-400">
                    高效、便捷的学生信息管理解决方案，帮助教育工作者轻松管理学生数据
                </p>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">快速链接</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors">首页</a></li>
                    <li><a href="ListStudentServlet.do" class="text-gray-400 hover:text-white transition-colors">学生列表</a></li>
                    <li><a href="jsp/studentinsert.jsp" class="text-gray-400 hover:text-white transition-colors">新增学生</a></li>
                    <li><a href="jsp/import.jsp" class="text-gray-400 hover:text-white transition-colors">数据导入</a></li>
                </ul>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">联系我们</h4>
                <ul class="space-y-2">
                    <li class="flex items-center">
                        <i class="fa fa-envelope-o mr-2 text-gray-400"></i>
                        <span class="text-gray-400">support@school.edu</span>
                    </li>
                    <li class="flex items-center">
                        <i class="fa fa-phone mr-2 text-gray-400"></i>
                        <span class="text-gray-400">+86 123 4567 8910</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="border-t border-gray-700 mt-8 pt-6 text-center text-gray-500">
            <p> 2025 学生信息管理系统 | GGBond</p>
        </div>
    </div>
</footer>

<script>
    // 页面滚动时导航栏样式变化
    window.addEventListener('scroll', function() {
        const header = document.querySelector('header');
        if (window.scrollY > 10) {
            header.classList.add('shadow-md');
            header.classList.remove('shadow-sm');
        } else {
            header.classList.remove('shadow-md');
            header.classList.add('shadow-sm');
        }
    });
</script>
</body>
</html>
