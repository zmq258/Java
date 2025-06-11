<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>ѧ����Ϣ����ϵͳ</title>
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
<!-- ������ -->
<header class="bg-white/90 backdrop-blur-md shadow-sm sticky top-0 z-50 transition-all duration-300">
    <div class="container mx-auto px-4 py-3 flex items-center justify-between">
        <div class="flex items-center space-x-2">
            <i class="fa fa-graduation-cap text-primary text-2xl"></i>
            <h1 class="text-xl md:text-2xl font-bold text-dark">ѧ����Ϣ����ϵͳ</h1>
        </div>
        <nav class="hidden md:flex items-center space-x-6">
            <a href="#" class="text-primary font-medium hover:text-secondary transition-colors">��ҳ</a>
            <a href="ListStudentServlet.do" class="text-dark/70 hover:text-primary transition-colors">ѧ���б�</a>
            <a href="jsp/studentinsert.jsp" class="text-dark/70 hover:text-primary transition-colors">����ѧ��</a>
            <a href="jsp/import.jsp" class="text-dark/70 hover:text-primary transition-colors">���ݵ���</a>
        </nav>
        <button class="md:hidden text-dark text-xl">
            <i class="fa fa-bars"></i>
        </button>
    </div>
</header>

<!-- �������� -->
<main class="flex-grow container mx-auto px-4 py-8">
    <!-- ��ӭ��Ϣ -->
    <section class="mb-12 text-center animate-fade-in">
        <div class="max-w-3xl mx-auto">
            <h2 class="text-[clamp(1.8rem,4vw,2.8rem)] font-bold text-dark mb-4 leading-tight">
                ��ӭʹ��ѧ����Ϣ����ϵͳ
            </h2>
            <p class="text-dark/70 text-lg md:text-xl mb-6">
                ����һ���������ƵĹ���ƽ̨�����԰�������Ч����ѧ����Ϣ����
            </p>
            <div class="flex flex-col sm:flex-row justify-center gap-4">
                <a href="ListStudentServlet.do" class="bg-primary hover:bg-secondary text-white font-medium py-3 px-6 rounded-lg transition-all duration-300 shadow-lg hover:shadow-xl">
                    <i class="fa fa-list mr-2"></i>�鿴ѧ���б�
                </a>
                <a href="jsp/studentinsert.jsp" class="bg-white hover:bg-gray-50 text-primary border border-primary font-medium py-3 px-6 rounded-lg transition-all duration-300 shadow-md hover:shadow-lg">
                    <i class="fa fa-plus mr-2"></i>����ѧ��
                </a>
            </div>
        </div>
    </section>

    <!-- ���ܿ�Ƭ -->
    <section class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <!-- ѧ����Ϣ����Ƭ -->
        <div class="bg-white rounded-xl overflow-hidden card-shadow card-hover animate-fade-in" style="animation-delay: 0.1s">
            <div class="h-2 bg-gradient-to-r from-primary to-accent"></div>
            <div class="p-6">
                <div class="flex items-start justify-between mb-4">
                    <div>
                        <h3 class="text-xl font-bold text-dark mb-1">ѧ����Ϣ����</h3>
                        <p class="text-dark/60">ȫ�����ѧ����Ϣ����</p>
                    </div>
                    <div class="w-14 h-14 rounded-full bg-primary/10 flex items-center justify-center">
                        <i class="fa fa-users text-2xl text-primary"></i>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-3 mt-6">
                    <a href="ListStudentServlet.do" class="bg-blue-50 hover:bg-blue-100 text-primary p-3 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-eye mr-2"></i> �鿴��Ϣ
                    </a>
                    <a href="jsp/studentinsert.jsp" class="bg-green-50 hover:bg-green-100 text-success p-3 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-plus mr-2"></i> ����ѧ��
                    </a>
                    <a href="ListStudentServlet.do?action=edit" class="bg-yellow-50 hover:bg-yellow-100 text-warning p-3 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-pencil mr-2"></i> �޸���Ϣ
                    </a>
                    <a href="ListStudentServlet.do?action=delete" class="bg-red-50 hover:bg-red-100 text-danger p-3 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-trash mr-2"></i> ɾ����Ϣ
                    </a>
                </div>
            </div>
        </div>

        <!-- ���ݵ��뿨Ƭ -->
        <div class="bg-white rounded-xl overflow-hidden card-shadow card-hover animate-fade-in" style="animation-delay: 0.2s">
            <div class="h-2 bg-gradient-to-r from-import to-teal-400"></div>
            <div class="p-6">
                <div class="flex items-start justify-between mb-4">
                    <div>
                        <h3 class="text-xl font-bold text-dark mb-1">������������</h3>
                        <p class="text-dark/60">ͨ��Excel�ļ���������ѧ������</p>
                    </div>
                    <div class="w-14 h-14 rounded-full bg-import/10 flex items-center justify-center">
                        <i class="fa fa-file-excel-o text-2xl text-import"></i>
                    </div>
                </div>
                <div class="mt-6">
                    <a href="jsp/import.jsp" class="w-full bg-import hover:bg-teal-500 text-white font-medium py-3 px-4 rounded-lg transition-all duration-300 flex items-center justify-center">
                        <i class="fa fa-upload mr-2"></i> ����Excel�ļ�
                    </a>
                </div>
                <div class="mt-4 p-3 bg-gray-50 rounded-lg">
                    <p class="text-sm text-dark/60">
                        <i class="fa fa-info-circle text-import mr-1"></i>
                        ֧����������ѧ����Ϣ���ļ���ʽΪXLS��XLSX
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- ϵͳ���ܽ��� -->
    <section class="mt-16 animate-fade-in" style="animation-delay: 0.3s">
        <h3 class="text-2xl font-bold text-center mb-10 text-dark">ϵͳ����</h3>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-white p-5 rounded-lg shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center mb-4">
                    <i class="fa fa-database text-primary"></i>
                </div>
                <h4 class="text-lg font-semibold mb-2 text-dark">���ݹ���</h4>
                <p class="text-dark/60">
                    ȫ�����ѧ��������Ϣ��������ӡ��޸ġ�ɾ���Ͳ�ѯ����
                </p>
            </div>
            <div class="bg-white p-5 rounded-lg shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 rounded-full bg-green-100 flex items-center justify-center mb-4">
                    <i class="fa fa-file-excel-o text-success"></i>
                </div>
                <h4 class="text-lg font-semibold mb-2 text-dark">��������</h4>
                <p class="text-dark/60">
                    ͨ��Excel�ļ���������ѧ�����ݣ��������¼��Ч��
                </p>
            </div>
            <div class="bg-white p-5 rounded-lg shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 rounded-full bg-purple-100 flex items-center justify-center mb-4">
                    <i class="fa fa-bar-chart text-purple-500"></i>
                </div>
                <h4 class="text-lg font-semibold mb-2 text-dark">����ͳ��</h4>
                <p class="text-dark/60">
                    �ṩѧ������ͳ�Ʒ������ܣ�֧�ֶ�ά�����ݲ鿴
                </p>
            </div>
        </div>
    </section>
</main>

<!-- ҳ�� -->
<footer class="bg-dark text-white py-8 mt-16">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div>
                <h4 class="text-lg font-semibold mb-4 flex items-center">
                    <i class="fa fa-graduation-cap mr-2"></i> ѧ����Ϣ����ϵͳ
                </h4>
                <p class="text-gray-400">
                    ��Ч����ݵ�ѧ����Ϣ�����������������������������ɹ���ѧ������
                </p>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">��������</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors">��ҳ</a></li>
                    <li><a href="ListStudentServlet.do" class="text-gray-400 hover:text-white transition-colors">ѧ���б�</a></li>
                    <li><a href="jsp/studentinsert.jsp" class="text-gray-400 hover:text-white transition-colors">����ѧ��</a></li>
                    <li><a href="jsp/import.jsp" class="text-gray-400 hover:text-white transition-colors">���ݵ���</a></li>
                </ul>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">��ϵ����</h4>
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
            <p> 2025 ѧ����Ϣ����ϵͳ | GGBond</p>
        </div>
    </div>
</footer>

<script>
    // ҳ�����ʱ��������ʽ�仯
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
