<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="../layout/header.jsp" />

        <link
            href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,600;9..144,700&family=Manrope:wght@400;500;600;700&display=swap"
            rel="stylesheet">

        <style>
            :root {
                --auth-ink: #0f172a;
                --auth-accent: #f97316;
                --auth-accent-dark: #ea580c;
                --auth-card: rgba(255, 255, 255, 0.92);
                --auth-border: rgba(15, 23, 42, 0.1);
                --auth-body: 'Manrope', sans-serif;
                --auth-heading: 'Fraunces', serif;
            }

            body {
                font-family: var(--auth-body);
                background-color: #0b0b0b;
            }

            .auth-shell {
                min-height: 100vh;
                padding: 140px 16px 80px;
                position: relative;
                display: flex;
                align-items: center;
                background: linear-gradient(120deg, rgba(15, 23, 42, 0.65), rgba(15, 23, 42, 0.35)),
                    url('https://images.unsplash.com/photo-1593640408182-31c70c8268f5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') center/cover no-repeat fixed;
            }

            .auth-shell::before {
                content: "";
                position: absolute;
                inset: 0;
                background: rgba(8, 12, 18, 0.45);
                backdrop-filter: blur(8px) saturate(120%);
            }

            .auth-card {
                position: relative;
                z-index: 1;
                max-width: 760px;
                margin: 0 auto;
                background: var(--auth-card);
                border-radius: 28px;
                border: 1px solid var(--auth-border);
                box-shadow: 0 24px 60px rgba(15, 23, 42, 0.2);
                padding: 36px 40px;
            }

            .auth-card h2 {
                font-family: var(--auth-heading);
                color: var(--auth-ink);
            }

            .auth-switch {
                display: inline-flex;
                gap: 6px;
                padding: 6px;
                border-radius: 999px;
                background: #0f172a;
                margin-bottom: 20px;
            }

            .auth-switch__item {
                text-decoration: none;
                color: #e2e8f0;
                padding: 8px 18px;
                border-radius: 999px;
                font-weight: 600;
                transition: 0.2s ease;
            }

            .auth-switch__item.is-active {
                background: #fff;
                color: #0f172a;
            }

            .auth-switch__item:hover {
                color: #fff;
            }

            .auth-subtitle {
                color: #475569;
                margin-bottom: 28px;
            }

            .form-label {
                font-weight: 600;
                color: #1e293b;
            }

            .btn-auth {
                background: var(--auth-accent);
                color: #fff;
                border: none;
                padding: 12px 24px;
                font-weight: 700;
                letter-spacing: 0.2px;
                border-radius: 999px;
                transition: 0.2s ease;
            }

            .btn-auth:hover {
                background: var(--auth-accent-dark);
                color: #fff;
            }

            .auth-note {
                font-size: 0.95rem;
                color: #475569;
            }

            @media (max-width: 768px) {
                .auth-card {
                    padding: 28px 24px;
                }
            }
        </style>

        <section class="auth-shell">
            <div class="container">
                <div class="auth-card">
                    <div class="text-center">
                        <div class="auth-switch">
                            <a class="auth-switch__item" href="/register">Dang ky</a>
                            <a class="auth-switch__item is-active" href="/login" aria-current="page">Dang nhap</a>
                        </div>
                        <h2 class="fw-bold mb-2">Dang nhap LaptopShop</h2>
                        <p class="auth-subtitle mb-0">Chao mung ban tro lai.</p>
                    </div>

                    <form action="/login" method="post" class="mt-4">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Email</label>
                                <input type="text" class="form-control" name="username" placeholder="you@example.com"
                                    autocomplete="email" required />
                            </div>
                            <div class="col-12">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" placeholder="••••••••"
                                    autocomplete="current-password" required />
                            </div>
                        </div>

                        <div class="d-flex flex-column flex-md-row align-items-md-center gap-3 mt-4">
                            <button type="submit" class="btn btn-auth px-5">Dang nhap</button>
                            <span class="auth-note">Chua co tai khoan? <a href="/register">Dang ky</a></span>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <jsp:include page="../layout/footer.jsp" />