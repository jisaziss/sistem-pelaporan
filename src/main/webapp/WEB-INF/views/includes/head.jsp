<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    ppks: {
                        yellow: '#FFDF16',
                        orange: '#FFAA16',
                        darkorange: '#FF5516',
                        lime: '#A5FF16',
                    },
                    primary: '#FF5516',
                    secondary: '#FFAA16',
                    accent: '#FFDF16',
                    success: '#A5FF16',
                }
            }
        }
    }
</script>
<style type="text/tailwindcss">
    .btn-primary {
        @apply bg-[#FF5516] text-white hover:bg-[#e04812] shadow-sm;
    }
    .btn-secondary {
        @apply bg-[#FFAA16] text-gray-900 hover:bg-[#e59913];
    }
    .badge {
        @apply inline-block px-3 py-1 text-xs font-bold rounded-full;
    }
    .card {
        @apply bg-white rounded-xl shadow-md p-6 border border-amber-100;
    }
</style>
