<%@ page language="java" import="java.util.*,dbutil.*,entity.*,model.*" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <title>ѧ����Ϣ�޸�</title>
    <meta charset="gbk">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        light: '#F8FAFC',
                        dark: '#1E293B',
                        neutral: '#64748B'
                    },
                    fontFamily: {
                        inter: ['Inter', 'system-ui', 'sans-serif'],
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
            .form-input-focus {
                @apply border-primary ring-2 ring-primary/20 transition-all duration-200;
            }
            .animate-fade-in {
                animation: fadeIn 0.5s ease-in-out;
            }
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }
            .btn-hover {
                @apply transform hover:scale-105 transition-all duration-200;
            }
        }
    </style>
</head>
<body class="font-inter bg-gray-50 min-h-screen flex flex-col">
<!-- �������� -->
<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="container mx-auto px-4 py-3 flex items-center justify-between">
        <div class="flex items-center space-x-2">
            <i class="fa fa-graduation-cap text-primary text-2xl"></i>
            <h1 class="text-xl font-bold text-dark">ѧ����Ϣ����ϵͳ</h1>
        </div>
        <nav class="hidden md:flex items-center space-x-6">
            <a href="ListStudentServlet.do" class="text-dark/70 hover:text-primary transition-colors">
                <i class="fa fa-list mr-1"></i> ѧ���б�
            </a>
            <a href="jsp/studentinsert.jsp" class="text-dark/70 hover:text-primary transition-colors">
                <i class="fa fa-plus mr-1"></i> ����ѧ��
            </a>
            <a href="jsp/import.jsp" class="text-dark/70 hover:text-primary transition-colors">
                <i class="fa fa-upload mr-1"></i> ���ݵ���
            </a>
        </nav>
        <button class="md:hidden text-dark text-xl">
            <i class="fa fa-bars"></i>
        </button>
    </div>
</header>

<!-- �������� -->
<main class="flex-grow container mx-auto px-4 py-8">
    <!-- ҳ����� -->
    <div class="mb-8 text-center animate-fade-in">
        <h2 class="text-[clamp(1.5rem,3vw,2.2rem)] font-bold text-dark mb-2">�޸�ѧ����Ϣ</h2>
        <p class="text-dark/60">���޸�����ѧ����Ϣ���ύ</p>
    </div>

    <!-- ѧ����Ϣ��Ƭ -->
    <div class="max-w-2xl mx-auto bg-white rounded-xl shadow-lg overflow-hidden animate-fade-in" style="animation-delay: 0.1s">
        <div class="h-2 bg-gradient-to-r from-primary to-accent"></div>

        <!-- ѧ��ID��ʾ -->
        <div class="p-4 bg-gray-50 border-b border-gray-100">
            <div class="flex items-center">
                <span class="text-dark/70 mr-2">ѧ��ѧ��:</span>
                <span class="font-medium text-primary">${student.id}</span>
            </div>
        </div>

        <!-- ������ -->
        <form action="DoUpdatStudenteservlet.do?id=${student.id}" method="post" class="p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- ���� -->
                <div class="form-group">
                    <label for="name" class="block text-sm font-medium text-dark/70 mb-1">����</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa fa-user text-gray-400"></i>
                        </div>
                        <input type="text" id="name" name="name" value="${student.name}"
                               class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:form-input-focus"
                               required>
                    </div>
                </div>

                <!-- �Ա� -->
                <div class="form-group">
                    <label for="sex" class="block text-sm font-medium text-dark/70 mb-1">�Ա�</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa fa-venus-mars text-gray-400"></i>
                        </div>
                        <select id="sex" name="sex"
                                class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:form-input-focus appearance-none bg-white"
                                required>
                            <option value="��" ${student.sex == '��' ? 'selected' : ''}>��</option>
                            <option value="Ů" ${student.sex == 'Ů' ? 'selected' : ''}>Ů</option>
                        </select>
                        <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                            <i class="fa fa-chevron-down text-gray-400"></i>
                        </div>
                    </div>
                </div>

                <!-- ���� -->
                <div class="form-group">
                    <label for="age" class="block text-sm font-medium text-dark/70 mb-1">����</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa fa-calendar text-gray-400"></i>
                        </div>
                        <input type="number" id="age" name="age" value="${student.age}"
                               class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:form-input-focus"
                               min="1" max="100" required>
                    </div>
                </div>

                <!-- �༶ -->
                <div class="form-group">
                    <label for="grade" class="block text-sm font-medium text-dark/70 mb-1">�༶</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa fa-users text-gray-400"></i>
                        </div>
                        <input type="text" id="grade" name="grade" value="${student.grade}"
                               class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:form-input-focus"
                               required>
                    </div>
                </div>

                <!-- �ɼ� -->
                <div class="form-group md:col-span-2">
                    <label for="score" class="block text-sm font-medium text-dark/70 mb-1">�ɼ�</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa fa-graduation-cap text-gray-400"></i>
                        </div>
                        <input type="number" id="score" name="score" value="${student.score}"
                               class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:form-input-focus"
                               min="0" max="100" step="0.1" required>
                    </div>
                    <div class="mt-1 text-xs text-gray-500">
                        ������0-100֮������֣����Ա���һλС��
                    </div>
                </div>
            </div>

            <!-- ��������ť -->
            <div class="mt-8 flex flex-wrap gap-3 justify-center">
                <button type="submit" class="bg-primary hover:bg-secondary text-white font-medium py-2.5 px-6 rounded-lg btn-hover flex items-center">
                    <i class="fa fa-check mr-2"></i> ȷ���޸�
                </button>
                <button type="reset" class="bg-gray-100 hover:bg-gray-200 text-dark font-medium py-2.5 px-6 rounded-lg btn-hover flex items-center">
                    <i class="fa fa-refresh mr-2"></i> ����
                </button>
                <a href="javascript:history.back()" class="bg-white border border-gray-300 hover:bg-gray-50 text-dark font-medium py-2.5 px-6 rounded-lg btn-hover flex items-center">
                    <i class="fa fa-arrow-left mr-2"></i> ����
                </a>
            </div>
        </form>
    </div>
</main>

<!-- ҳ�� -->
<footer class="bg-dark text-white py-6 mt-12">
    <div class="container mx-auto px-4 text-center">
        <p class="text-gray-400">? 2025 ѧ����Ϣ����ϵͳ | QuantumLeap������ԾǨ��</p>
    </div>
</footer>

<!-- JavaScript -->
<script>
    // ����֤
    document.querySelector('form').addEventListener('submit', function(e) {
        const inputs = this.querySelectorAll('input[required], select[required]');
        let isValid = true;

        inputs.forEach(input => {
            if (!input.value.trim()) {
                isValid = false;
                input.classList.add('border-danger');

                // ��Ӵ�����ʾ
                if (!input.nextElementSibling || !input.nextElementSibling.classList.contains('error-message')) {
                    const errorMsg = document.createElement('p');
                    errorMsg.classList.add('error-message', 'text-danger', 'text-xs', 'mt-1');
                    errorMsg.textContent = '���ֶβ���Ϊ��';
                    input.parentNode.appendChild(errorMsg);
                }
            } else {
                input.classList.remove('border-danger');
                // �Ƴ�������ʾ
                const errorMsg = input.nextElementSibling;
                if (errorMsg && errorMsg.classList.contains('error-message')) {
                    errorMsg.remove();
                }
            }
        });

        // ��֤���䷶Χ
        const ageInput = document.getElementById('age');
        if (ageInput.value && (parseInt(ageInput.value) < 1 || parseInt(ageInput.value) > 100)) {
            isValid = false;
            ageInput.classList.add('border-danger');

            if (!ageInput.nextElementSibling || !ageInput.nextElementSibling.classList.contains('error-message')) {
                const errorMsg = document.createElement('p');
                errorMsg.classList.add('error-message', 'text-danger', 'text-xs', 'mt-1');
                errorMsg.textContent = '���������1-100֮��';
                ageInput.parentNode.appendChild(errorMsg);
            }
        }

        // ��֤�ɼ���Χ
        const scoreInput = document.getElementById('score');
        if (scoreInput.value && (parseFloat(scoreInput.value) < 0 || parseFloat(scoreInput.value) > 100)) {
            isValid = false;
            scoreInput.classList.add('border-danger');

            if (!scoreInput.nextElementSibling || !scoreInput.nextElementSibling.classList.contains('error-message')) {
                const errorMsg = document.createElement('p');
                errorMsg.classList.add('error-message', 'text-danger', 'text-xs', 'mt-1');
                errorMsg.textContent = '�ɼ�������0-100֮��';
                scoreInput.parentNode.appendChild(errorMsg);
            }
        }

        if (!isValid) {
            e.preventDefault();
            // ��������һ�������ֶ�
            const firstError = this.querySelector('.border-danger');
            if (firstError) {
                firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }
    });

    // ������ý���ʱ����ʽ
    document.querySelectorAll('input, select').forEach(input => {
        input.addEventListener('focus', function() {
            this.classList.add('form-input-focus');
        });

        input.addEventListener('blur', function() {
            this.classList.remove('form-input-focus');
        });
    });
</script>
</body>
</html>
