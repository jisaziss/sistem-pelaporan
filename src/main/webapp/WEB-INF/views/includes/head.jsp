<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    primary: '#2563eb',
                    secondary: '#64748b',
                    danger: '#dc2626',
                    success: '#16a34a',
                    warning: '#ea580c',
                }
            }
        }
    }
</script>
<style type="text/tailwindcss">
    /* Custom CSS jika perlu */
    .badge {
        @apply inline-block px-3 py-1 text-xs font-semibold rounded-full;
    }
    .btn {
        @apply px-4 py-2 rounded-lg font-medium transition-colors duration-200;
    }
    .btn-primary {
        @apply bg-blue-600 text-white hover:bg-blue-700;
    }
    .btn-secondary {
        @apply bg-gray-600 text-white hover:bg-gray-700;
    }
    .btn-danger {
        @apply bg-red-600 text-white hover:bg-red-700;
    }
    .card {
        @apply bg-white rounded-lg shadow-md p-6;
    }
</style>
