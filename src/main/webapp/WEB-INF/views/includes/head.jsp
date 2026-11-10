<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="theme-color" content="#174F38">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
<script>
    tailwind = window.tailwind || {};
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    ppks: {
                        forest: '#174F38',
                        green: '#26734E',
                        gold: '#D5AD52',
                        cream: '#F7F7F2',
                        ink: '#26352D'
                    },
                    primary: '#174F38',
                    secondary: '#D5AD52',
                    accent: '#26734E',
                    success: '#26734E'
                },
                fontFamily: {
                    sans: ['DM Sans', 'sans-serif'],
                    display: ['Playfair Display', 'serif']
                }
            }
        }
    };
</script>
<script src="https://cdn.tailwindcss.com"></script>
<style>
    :root {
        --ppks-forest: #174F38;
        --ppks-green: #26734E;
        --ppks-gold: #D5AD52;
        --ppks-cream: #F7F7F2;
        --ppks-ink: #26352D;
        --ppks-muted: #68756D;
        --ppks-line: #E5E9E2;
    }
    * { box-sizing: border-box; }
    body { font-family: 'DM Sans', sans-serif; color: var(--ppks-ink); }
    .page-shell {
        background:
            radial-gradient(circle at 90% 0%, rgba(213,173,82,.10), transparent 26rem),
            var(--ppks-cream);
    }
    h1, h2, h3 { letter-spacing: -.025em; }
    .font-display { font-family: 'Playfair Display', serif; }
    .btn-primary {
        background: var(--ppks-forest); color: #fff;
        box-shadow: 0 8px 18px rgba(23,79,56,.13);
        transition: background .2s ease, transform .2s ease, box-shadow .2s ease;
    }
    .btn-primary:hover { background: #123D2C; transform: translateY(-1px); }
    .btn-secondary {
        background: #F3EBD8; color: var(--ppks-forest);
        border: 1px solid #E5D5AF;
    }
    .badge { display:inline-flex; align-items:center; padding:.3rem .75rem; font-size:.75rem; font-weight:700; border-radius:999px; }
    .card {
        background:#fff; border:1px solid var(--ppks-line); border-radius:1rem;
        box-shadow:0 8px 24px rgba(31,55,41,.045);
    }
    input:not([type=checkbox]):not([type=radio]):not([type=file]),
    select, textarea {
        border-color:#D8DED7 !important;
        border-radius:.75rem !important;
        background:#fff;
        transition:border-color .2s ease, box-shadow .2s ease;
    }
    input:focus, select:focus, textarea:focus {
        outline:none;
        border-color:var(--ppks-green) !important;
        box-shadow:0 0 0 3px rgba(38,115,78,.12) !important;
    }
    button, a { -webkit-tap-highlight-color: transparent; }
    table { border-collapse:separate; border-spacing:0; }
    @media (max-width:640px) {
        main.container { padding-left:1rem; padding-right:1rem; }
        table { min-width:650px; }
        .overflow-x-auto { overflow-x:auto; }
    }
</style>
