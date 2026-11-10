<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="theme-color" content="#FFFFFF">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo:wght@600;700;800&family=Barlow:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logoPPKS.png">
<script>
    tailwind = window.tailwind || {};
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    ppks: {
                        forest: '#5E8C73',
                        green: '#7FA892',
                        gold: '#F6D365',
                        goldtext: '#C99A1E',
                        cream: '#F7FAF8',
                        ink: '#2F4A3E'
                    },
                    primary: '#5C7FA8',
                    secondary: '#F6D365',
                    accent: '#7FA892',
                    success: '#5FA283'
                },
                fontFamily: {
                    sans: ['Barlow', 'sans-serif'],
                    display: ['Archivo', 'sans-serif']
                }
            }
        }
    };
</script>
<script src="https://cdn.tailwindcss.com"></script>
<style>
    :root {
        --ppks-forest: #5E8C73;
        --ppks-green: #7FA892;
        --ppks-gold: #F6D365;
        --ppks-cream: #F7FAF8;
        --ppks-ink: #2F4A3E;
        --ppks-muted: #5F7568;
        --ppks-line: #D5E3DA;
    }
    * { box-sizing: border-box; }

    body { font-family: 'Barlow', sans-serif; color: var(--ppks-ink); }
    h1, h2, h3, .font-display {
        font-family: 'Archivo', sans-serif;
        letter-spacing: -.02em;
    }

    /* latar halaman: putih polos */
    .page-shell {
        background: #FFFFFF;
        background-color: #FFFFFF;
    }

    /* teks gradasi hijau -> emas (dipakai di judul) */
    .text-hijau-kuning {
        background: linear-gradient(90deg, #4F7A63 0%, #C99A1E 100%);
        -webkit-background-clip: text;
        background-clip: text;
        -webkit-text-fill-color: transparent;
        color: transparent;
    }

    .btn-primary {
        background: #5C7FA8; color: #fff;
        box-shadow: 0 8px 18px rgba(92,127,168,.25);
        transition: background .25s ease, transform .2s ease, box-shadow .25s ease;
    }
    .btn-primary:hover {
        background: #5E8C73; transform: translateY(-1px);
        box-shadow: 0 8px 18px rgba(94,140,115,.3);
    }
    .btn-secondary {
        background: #FFF9E3; color: var(--ppks-forest);
        border: 1px solid #F6E3A3; transition: background .25s ease;
    }
    .btn-secondary:hover { background: #FBEFC0; }

    .card {
        background:#fff; border:1px solid var(--ppks-line); border-radius:1rem;
        box-shadow:0 6px 20px rgba(47,74,62,.07);
    }
    input:not([type=checkbox]):not([type=radio]):not([type=file]),
    select, textarea {
        border-color:#C9DAD0 !important;
        border-radius:.6rem !important;
        background:#fff;
        transition:border-color .2s ease, box-shadow .2s ease;
    }
    input:focus, select:focus, textarea:focus {
        outline:none;
        border-color:var(--ppks-green) !important;
        box-shadow:0 0 0 3px rgba(127,168,146,.2) !important;
    }
    button, a { -webkit-tap-highlight-color: transparent; }
    table { border-collapse:separate; border-spacing:0; }
    @media (max-width:640px) {
        main.container { padding-left:1rem; padding-right:1rem; }
        table { min-width:650px; }
        .overflow-x-auto { overflow-x:auto; }
    }
</style>