<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="theme-color" content="#17202c">
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-title" content="Hunter Gems">
  <link rel="manifest" href="manifest.webmanifest">
  <link rel="icon" href="icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.svg">
  <title>Hunter Gems Dealer App</title>
  <style>
    :root {
      --ink: #15171c;
      --muted: #67717f;
      --line: #dbe1e8;
      --panel: rgba(255, 255, 255, 0.96);
      --wash: #f4f7fb;
      --nav: #111827;
      --nav-soft: #243244;
      --blue: #1d4ed8;
      --green: #047857;
      --red: #b91c1c;
      --amber: #b45309;
      --focus: rgba(37, 99, 235, 0.18);
      --shadow: 0 18px 40px rgba(27, 39, 54, 0.12);
    }

    * {
      box-sizing: border-box;
    }

    html,
    body {
      margin: 0;
      min-height: 100%;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      color: var(--ink);
      background:
        linear-gradient(rgba(244, 247, 251, 0.9), rgba(244, 247, 251, 0.9)),
        url("https://images.unsplash.com/photo-1605100804763-247f67b3557e?auto=format&fit=crop&w=1800&q=80") center/cover fixed;
    }

    .gem-bg-video {
      position: fixed;
      right: 18px;
      bottom: 18px;
      z-index: 0;
      width: min(360px, 42vw);
      aspect-ratio: 16 / 9;
      border: 1px solid rgba(255, 255, 255, 0.42);
      border-radius: 8px;
      object-fit: cover;
      opacity: 0.18;
      pointer-events: none;
      box-shadow: 0 18px 42px rgba(15, 23, 42, 0.24);
    }

    .login-view,
    .app {
      position: relative;
      z-index: 1;
    }

    button,
    input,
    select,
    textarea {
      font: inherit;
    }

    button {
      cursor: pointer;
    }

    .hidden {
      display: none !important;
    }

    .login-view {
      min-height: 100vh;
      display: grid;
      grid-template-columns: minmax(280px, 420px) 1fr;
      background:
        linear-gradient(115deg, rgba(23, 32, 44, 0.94), rgba(23, 32, 44, 0.78)),
        url("https://images.unsplash.com/photo-1617038260897-41a1f14a8ca0?auto=format&fit=crop&w=1800&q=80") center/cover;
    }

    .login-panel {
      min-height: 100vh;
      padding: 38px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      background: rgba(255, 255, 255, 0.96);
    }

    .login-brand {
      margin-bottom: 34px;
    }

    .brand-mark {
      display: inline-grid;
      place-items: center;
      width: 46px;
      height: 46px;
      margin-bottom: 16px;
      border-radius: 8px;
      color: #fff;
      background: linear-gradient(135deg, #2563eb, #15803d);
      font-weight: 800;
    }

    h1,
    h2,
    h3,
    p {
      margin-top: 0;
    }

    .login-brand h1 {
      margin-bottom: 8px;
      font-size: 2rem;
      letter-spacing: 0;
    }

    .muted {
      color: var(--muted);
      line-height: 1.5;
    }

    .login-form {
      display: grid;
      gap: 16px;
    }

    label {
      display: grid;
      gap: 7px;
      font-size: 0.9rem;
      font-weight: 700;
    }

    input,
    select,
    textarea {
      width: 100%;
      border: 1px solid var(--line);
      border-radius: 6px;
      padding: 11px 12px;
      color: var(--ink);
      background: #fff;
      outline: none;
    }

    textarea {
      resize: vertical;
      min-height: 78px;
    }

    input:focus,
    select:focus,
    textarea:focus {
      border-color: var(--blue);
      box-shadow: 0 0 0 4px var(--focus);
    }

    .login-note {
      padding: 12px;
      border: 1px solid var(--line);
      border-radius: 6px;
      background: #f8fafc;
      color: var(--muted);
      font-size: 0.9rem;
    }

    .login-error {
      padding: 10px 12px;
      border: 1px solid #fecaca;
      border-radius: 6px;
      color: var(--red);
      background: #fff5f5;
      font-weight: 800;
    }

    .login-art {
      display: flex;
      align-items: flex-end;
      justify-content: flex-end;
      padding: 40px;
      color: #fff;
    }

    .login-art strong {
      display: block;
      max-width: 620px;
      font-size: clamp(2.4rem, 5vw, 5.4rem);
      line-height: 0.95;
      letter-spacing: 0;
    }

    .app {
      min-height: 100vh;
      display: grid;
      grid-template-columns: 260px 1fr;
    }

    .sidebar {
      position: sticky;
      top: 0;
      height: 100vh;
      padding: 20px 16px;
      color: #e7edf5;
      background: var(--nav);
      overflow-y: auto;
    }

    .sidebar-brand {
      display: flex;
      align-items: center;
      gap: 12px;
      margin-bottom: 22px;
      padding: 4px 6px 18px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.12);
    }

    .sidebar-brand .brand-mark {
      margin: 0;
      width: 38px;
      height: 38px;
    }

    .sidebar-brand strong {
      display: block;
    }

    .sidebar-brand span:last-child {
      color: #aab6c5;
      font-size: 0.82rem;
    }

    .dealer-contact {
      margin: -8px 6px 18px;
      padding: 10px;
      border-radius: 6px;
      color: #cbd5e1;
      background: rgba(255, 255, 255, 0.06);
      font-size: 0.82rem;
      line-height: 1.5;
      overflow-wrap: anywhere;
    }

    .nav-list {
      display: grid;
      gap: 6px;
    }

    .nav-button {
      width: 100%;
      border: 0;
      border-radius: 6px;
      padding: 11px 12px;
      display: flex;
      align-items: center;
      gap: 10px;
      color: #dbe7f4;
      background: transparent;
      text-align: left;
      font-weight: 700;
    }

    .nav-button:hover,
    .nav-button.active {
      background: var(--nav-soft);
      color: #fff;
    }

    .nav-icon {
      width: 24px;
      text-align: center;
      font-weight: 900;
    }

    .sidebar-footer {
      margin-top: 22px;
      padding-top: 16px;
      border-top: 1px solid rgba(255, 255, 255, 0.12);
    }

    .main {
      min-width: 0;
      padding: 22px;
      background: rgba(244, 247, 251, 0.74);
      backdrop-filter: blur(3px);
    }

    .business-strip {
      margin-bottom: 16px;
      border: 1px solid var(--line);
      border-left: 5px solid var(--blue);
      border-radius: 8px;
      padding: 14px 16px;
      display: grid;
      grid-template-columns: 1fr auto;
      gap: 12px;
      align-items: center;
      background: rgba(255, 255, 255, 0.97);
      box-shadow: 0 8px 18px rgba(27, 39, 54, 0.05);
    }

    .business-strip strong {
      display: block;
      margin-bottom: 4px;
      font-size: 1.08rem;
    }

    .business-strip span {
      color: var(--muted);
      font-size: 0.9rem;
      line-height: 1.5;
    }

    .business-badge {
      padding: 8px 10px;
      border-radius: 6px;
      color: #0f172a;
      background: #e0f2fe;
      font-size: 0.8rem;
      font-weight: 900;
      text-transform: uppercase;
    }

    .topline {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 18px;
      margin-bottom: 18px;
    }

    .photo-banner {
      min-height: 128px;
      margin-bottom: 14px;
      border-radius: 8px;
      border: 1px solid var(--line);
      display: flex;
      align-items: flex-end;
      overflow: hidden;
      color: #fff;
      background-position: center;
      background-size: cover;
      box-shadow: var(--shadow);
    }

    .photo-banner span {
      width: 100%;
      padding: 34px 18px 16px;
      background: linear-gradient(180deg, transparent, rgba(15, 23, 42, 0.82));
      font-size: 1.15rem;
      font-weight: 800;
    }

    .banner-dashboard {
      background-image: url("https://images.unsplash.com/photo-1617038260897-41a1f14a8ca0?auto=format&fit=crop&w=1400&q=80");
    }

    .banner-inventory {
      background-image: url("https://images.unsplash.com/photo-1605100804763-247f67b3557e?auto=format&fit=crop&w=1400&q=80");
    }

    .banner-customers {
      background-image: url("https://images.unsplash.com/photo-1573408301185-9146fe634ad0?auto=format&fit=crop&w=1400&q=80");
    }

    .banner-sales {
      background-image: url("https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?auto=format&fit=crop&w=1400&q=80");
    }

    .banner-expenses {
      background-image: url("https://images.unsplash.com/photo-1554224155-6726b3ff858f?auto=format&fit=crop&w=1400&q=80");
    }

    .banner-reports {
      background-image: url("https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&w=1400&q=80");
    }

    .banner-settings {
      background-image: url("https://images.unsplash.com/photo-1544376664-80b17f09d399?auto=format&fit=crop&w=1400&q=80");
    }

    .topline h2 {
      margin-bottom: 4px;
      font-size: 1.55rem;
    }

    .actions {
      display: flex;
      align-items: center;
      gap: 10px;
      flex-wrap: wrap;
    }

    .btn {
      min-height: 40px;
      border: 1px solid var(--line);
      border-radius: 6px;
      padding: 9px 13px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      background: #fff;
      color: var(--ink);
      font-weight: 800;
      white-space: nowrap;
      box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
    }

    .btn.primary {
      border-color: var(--blue);
      color: #fff;
      background: var(--blue);
    }

    .btn.danger {
      border-color: #fecaca;
      color: var(--red);
      background: #fff5f5;
    }

    .btn.success {
      border-color: #bbf7d0;
      color: var(--green);
      background: #f0fdf4;
    }

    .btn:disabled {
      cursor: not-allowed;
      opacity: 0.55;
    }

    .section {
      display: none;
    }

    .section.active {
      display: block;
    }

    .stats-grid {
      display: grid;
      grid-template-columns: repeat(4, minmax(0, 1fr));
      gap: 12px;
      margin-bottom: 14px;
    }

    .stat {
      min-height: 100px;
      border: 1px solid var(--line);
      border-radius: 8px;
      padding: 16px;
      background: var(--panel);
      box-shadow: 0 8px 18px rgba(27, 39, 54, 0.04);
    }

    .stat span {
      display: block;
      margin-bottom: 8px;
      color: var(--muted);
      font-size: 0.85rem;
      font-weight: 700;
    }

    .stat strong {
      font-size: 1.55rem;
    }

    .work-grid {
      display: grid;
      grid-template-columns: 1fr 360px;
      gap: 14px;
      align-items: start;
    }

    .panel {
      border: 1px solid var(--line);
      border-radius: 8px;
      background: var(--panel);
      box-shadow: 0 8px 18px rgba(27, 39, 54, 0.04);
    }

    .panel-header {
      min-height: 58px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      padding: 14px 16px;
      border-bottom: 1px solid var(--line);
    }

    .panel-header h3 {
      margin: 0;
      font-size: 1rem;
    }

    .panel-body {
      padding: 16px;
    }

    .form-grid {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 12px;
    }

    .form-grid .wide {
      grid-column: 1 / -1;
    }

    .toolbar-row {
      display: grid;
      grid-template-columns: minmax(200px, 1fr) 180px 180px;
      gap: 10px;
      margin-bottom: 12px;
    }

    .table-wrap {
      overflow: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      min-width: 760px;
      font-size: 0.92rem;
    }

    th,
    td {
      padding: 12px 10px;
      border-bottom: 1px solid var(--line);
      text-align: left;
      vertical-align: top;
    }

    th {
      color: var(--muted);
      background: #f8fafc;
      font-size: 0.78rem;
      text-transform: uppercase;
      letter-spacing: 0;
    }

    tr:hover td {
      background: #fbfdff;
    }

    .status {
      display: inline-flex;
      align-items: center;
      min-height: 26px;
      padding: 4px 8px;
      border-radius: 999px;
      font-size: 0.78rem;
      font-weight: 800;
    }

    .status.stock {
      color: #1d4ed8;
      background: #dbeafe;
    }

    .status.sold {
      color: #166534;
      background: #dcfce7;
    }

    .status.hold {
      color: #92400e;
      background: #fef3c7;
    }

    .status.memo {
      color: #7c3aed;
      background: #ede9fe;
    }

    .row-actions {
      display: flex;
      gap: 6px;
      flex-wrap: wrap;
    }

    .icon-btn {
      min-width: 48px;
      height: 34px;
      border: 1px solid var(--line);
      border-radius: 6px;
      background: #fff;
      padding: 0 9px;
      font-size: 0.78rem;
      font-weight: 900;
    }

    .activity-list {
      display: grid;
      gap: 10px;
    }

    .gem-gallery {
      display: grid;
      grid-template-columns: repeat(4, minmax(0, 1fr));
      gap: 12px;
      margin-bottom: 14px;
    }

    .gem-photo-card {
      min-height: 150px;
      border: 1px solid var(--line);
      border-radius: 8px;
      overflow: hidden;
      display: flex;
      align-items: flex-end;
      color: #fff;
      background-position: center;
      background-size: cover;
      box-shadow: 0 8px 18px rgba(27, 39, 54, 0.08);
    }

    .gem-photo-card span {
      width: 100%;
      padding: 36px 12px 12px;
      background: linear-gradient(180deg, transparent, rgba(15, 23, 42, 0.78));
      font-weight: 800;
    }

    .gem-cell {
      display: grid;
      grid-template-columns: 52px 1fr;
      gap: 10px;
      align-items: center;
    }

    .gem-thumb {
      width: 52px;
      height: 52px;
      border-radius: 8px;
      border: 1px solid var(--line);
      object-fit: cover;
      background: #f8fafc;
    }

    .activity-item {
      border-left: 3px solid var(--blue);
      padding: 10px 12px;
      background: #f8fafc;
      border-radius: 6px;
    }

    .activity-item strong {
      display: block;
      margin-bottom: 3px;
    }

    .empty {
      padding: 26px;
      color: var(--muted);
      text-align: center;
    }

    .notice {
      margin-bottom: 12px;
      padding: 10px 12px;
      border-radius: 6px;
      border: 1px solid #bfdbfe;
      color: #1e3a8a;
      background: #eff6ff;
      font-weight: 700;
    }

    .settings-grid {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 14px;
    }

    .danger-zone {
      border-color: #fecaca;
      background: #fff7f7;
    }

    .rate-preview {
      padding: 10px 12px;
      border: 1px solid #bbf7d0;
      border-radius: 6px;
      color: #14532d;
      background: #f0fdf4;
      font-weight: 800;
    }

    .file-input {
      border: 1px dashed var(--line);
      border-radius: 6px;
      padding: 14px;
      background: #f8fafc;
    }

    @media (max-width: 1050px) {
      .app {
        grid-template-columns: 1fr;
      }

      .sidebar {
        position: static;
        height: auto;
      }

      .nav-list {
        grid-template-columns: repeat(4, minmax(0, 1fr));
      }

      .work-grid,
      .settings-grid {
        grid-template-columns: 1fr;
      }

      .stats-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
      }
    }

    @media (max-width: 760px) {
      .login-view {
        grid-template-columns: 1fr;
      }

      .login-art {
        display: none;
      }

      .login-panel {
        padding: 24px;
      }

      .main {
        padding: 14px;
      }

      .business-strip {
        grid-template-columns: 1fr;
      }

      .topline {
        align-items: flex-start;
        flex-direction: column;
      }

      .nav-list,
      .stats-grid,
      .gem-gallery,
      .form-grid,
      .toolbar-row {
        grid-template-columns: 1fr;
      }

      .actions {
        width: 100%;
      }

      .btn {
        flex: 1;
      }

      .gem-bg-video {
        right: 10px;
        bottom: 10px;
        width: 170px;
        opacity: 0.24;
      }
    }
  </style>
</head>
<body>
  <video class="gem-bg-video" autoplay muted loop playsinline poster="https://images.unsplash.com/photo-1605100804763-247f67b3557e?auto=format&fit=crop&w=900&q=80">
    <source src="https://videos.pexels.com/video-files/9547780/9547780-uhd_2560_1440_25fps.mp4" type="video/mp4">
  </video>

  <section id="loginView" class="login-view">
    <div class="login-panel">
      <div class="login-brand">
        <span class="brand-mark">HG</span>
        <h1>Hunter Gems</h1>
        <p class="muted">Professional inventory, rate book, customer, sales, and payment records for a gems dealer.</p>
      </div>

      <form id="loginForm" class="login-form">
        <label>
          User name
          <input id="loginUser" autocomplete="username" required>
        </label>
        <label>
          Password
          <input id="loginPass" type="password" autocomplete="current-password" required>
        </label>
        <button class="btn primary" type="submit">Open App</button>
        <div id="loginError" class="login-error hidden">Wrong user name or password.</div>
        <button id="resetLoginBtn" class="btn" type="button">Reset login to default</button>
        <div class="login-note">
          Default login: <strong>admin</strong> / <strong>admin123</strong>
        </div>
      </form>
    </div>
    <div class="login-art">
      <strong>Dealer records with stock clarity.</strong>
    </div>
  </section>

  <section id="appView" class="app hidden">
    <aside class="sidebar">
      <div class="sidebar-brand">
        <span class="brand-mark">GL</span>
        <span>
          <strong>Hunter Gems</strong>
          <span id="storeNameSide">Gems Dealer</span>
        </span>
      </div>
      <div id="dealerContactSide" class="dealer-contact"></div>

      <nav class="nav-list" id="navList">
        <button class="nav-button active" data-section="dashboard"><span class="nav-icon">D</span>Dashboard</button>
        <button class="nav-button" data-section="inventory"><span class="nav-icon">I</span>Inventory</button>
        <button class="nav-button" data-section="customers"><span class="nav-icon">C</span>Customers</button>
        <button class="nav-button" data-section="sales"><span class="nav-icon">S</span>Sales</button>
        <button class="nav-button" data-section="expenses"><span class="nav-icon">E</span>Expenses</button>
        <button class="nav-button" data-section="reports"><span class="nav-icon">R</span>Reports</button>
        <button class="nav-button" data-section="settings"><span class="nav-icon">G</span>Settings</button>
      </nav>

      <div class="sidebar-footer">
        <button id="logoutBtn" class="btn danger" type="button">Log out</button>
      </div>
    </aside>

    <main class="main">
      <div id="message" class="notice hidden"></div>
      <div class="business-strip">
        <div>
          <strong id="businessStripName">Hunter Gems</strong>
          <span id="businessStripContact">hunter108kin@gmail.com | 8791753303 | 1110 Malhupura, Muzaffarnagar</span>
        </div>
        <div class="business-badge">Dealer System</div>
      </div>

      <section id="dashboard" class="section active">
        <div class="topline">
          <div>
            <h2>Dashboard</h2>
            <p class="muted">Today is <span id="todayText"></span></p>
          </div>
          <div class="actions">
            <button class="btn primary" data-section-jump="inventory">+ Gem</button>
            <button class="btn success" data-section-jump="sales">+ Sale</button>
          </div>
        </div>
        <div class="photo-banner banner-dashboard"><span>Daily stock, sales, and due balance overview</span></div>

        <div class="gem-gallery" id="gemGallery"></div>

        <div class="stats-grid">
          <article class="stat"><span>Total Stock Value</span><strong id="statStockValue">0</strong></article>
          <article class="stat"><span>Available Pieces</span><strong id="statPieces">0</strong></article>
          <article class="stat"><span>Total Sales</span><strong id="statSales">0</strong></article>
          <article class="stat"><span>Outstanding Balance</span><strong id="statBalance">0</strong></article>
        </div>

        <div class="work-grid">
          <div class="panel">
            <div class="panel-header">
              <h3>Recent Sales</h3>
              <button class="btn" data-section-jump="sales">View</button>
            </div>
            <div class="table-wrap">
              <table>
                <thead>
                  <tr><th>Date</th><th>Customer</th><th>Gem</th><th>Amount</th><th>Paid</th></tr>
                </thead>
                <tbody id="recentSalesBody"></tbody>
              </table>
            </div>
          </div>

          <div class="panel">
            <div class="panel-header"><h3>Activity</h3></div>
            <div id="activityList" class="panel-body activity-list"></div>
          </div>
        </div>
      </section>

      <section id="inventory" class="section">
        <div class="topline">
          <div>
            <h2>Inventory</h2>
            <p class="muted">Store stone details, certificates, purchase cost, and selling price.</p>
          </div>
        </div>
        <div class="photo-banner banner-inventory"><span>Manage stones with rates, certificates, and status</span></div>

        <div class="work-grid">
          <div class="panel">
            <div class="panel-header">
              <h3>Gem Stock</h3>
              <button id="clearGemForm" class="btn">New</button>
            </div>
            <div class="panel-body">
              <div class="toolbar-row">
                <input id="gemSearch" placeholder="Search inventory">
                <select id="gemStatusFilter">
                  <option value="">All status</option>
                  <option value="In Stock">In Stock</option>
                  <option value="On Hold">On Hold</option>
                  <option value="Memo">Memo</option>
                  <option value="Sold">Sold</option>
                </select>
                <select id="gemTypeFilter">
                  <option value="">All gem types</option>
                </select>
              </div>
              <div class="table-wrap">
                <table>
                  <thead>
                    <tr><th>Code</th><th>Gem</th><th>Weight</th><th>Color</th><th>Status</th><th>Cost</th><th>Price</th><th>Actions</th></tr>
                  </thead>
                  <tbody id="inventoryBody"></tbody>
                </table>
              </div>
            </div>
          </div>

          <form id="gemForm" class="panel">
            <div class="panel-header"><h3 id="gemFormTitle">Add Gem</h3></div>
            <div class="panel-body form-grid">
              <input id="gemId" type="hidden">
              <label>Stock code<input id="gemCode" required></label>
              <label>Gem type<input id="gemType" placeholder="Ruby, Sapphire, Emerald" required></label>
              <label>Weight carat<input id="gemWeight" type="number" min="0" step="0.01" required></label>
              <label>Rate per carat<input id="gemRate" type="number" min="0" step="0.01" placeholder="From rate book"></label>
              <label>Shape<input id="gemShape" placeholder="Oval, Cushion, Round"></label>
              <label>Color<input id="gemColor"></label>
              <label>Clarity<input id="gemClarity"></label>
              <label>Certificate<input id="gemCertificate" placeholder="GIA / IGI / Local"></label>
              <label>Status<select id="gemStatus"><option>In Stock</option><option>On Hold</option><option>Memo</option><option>Sold</option></select></label>
              <label>Purchase cost<input id="gemCost" type="number" min="0" step="0.01"></label>
              <label>Selling price<input id="gemPrice" type="number" min="0" step="0.01"></label>
              <div id="ratePreview" class="rate-preview wide hidden"></div>
              <button id="applyRateBtn" class="btn success wide" type="button">Apply Rate Book Price</button>
              <label class="wide">Notes<textarea id="gemNotes"></textarea></label>
              <button class="btn primary wide" type="submit">Save Gem</button>
            </div>
          </form>
        </div>
      </section>

      <section id="customers" class="section">
        <div class="topline">
          <div>
            <h2>Customers</h2>
            <p class="muted">Keep buyer, supplier, and broker contact records together.</p>
          </div>
        </div>
        <div class="photo-banner banner-customers"><span>Buyer, supplier, and broker relationships in one place</span></div>

        <div class="work-grid">
          <div class="panel">
            <div class="panel-header"><h3>Customer List</h3></div>
            <div class="panel-body">
              <input id="customerSearch" placeholder="Search customers">
            </div>
            <div class="table-wrap">
              <table>
                <thead>
                  <tr><th>Name</th><th>Type</th><th>Phone</th><th>Email</th><th>Balance</th><th>Actions</th></tr>
                </thead>
                <tbody id="customersBody"></tbody>
              </table>
            </div>
          </div>

          <form id="customerForm" class="panel">
            <div class="panel-header"><h3 id="customerFormTitle">Add Customer</h3></div>
            <div class="panel-body form-grid">
              <input id="customerId" type="hidden">
              <label class="wide">Name<input id="customerName" required></label>
              <label>Type<select id="customerType"><option>Buyer</option><option>Supplier</option><option>Broker</option></select></label>
              <label>Phone<input id="customerPhone"></label>
              <label class="wide">Email<input id="customerEmail" type="email"></label>
              <label class="wide">Address<textarea id="customerAddress"></textarea></label>
              <button class="btn primary wide" type="submit">Save Customer</button>
            </div>
          </form>
        </div>
      </section>

      <section id="sales" class="section">
        <div class="topline">
          <div>
            <h2>Sales</h2>
            <p class="muted">Record invoices, paid amount, and balance per customer.</p>
          </div>
        </div>
        <div class="photo-banner banner-sales"><span>Convert stones into invoices and payment records</span></div>

        <div class="work-grid">
          <div class="panel">
            <div class="panel-header"><h3>Sales Register</h3></div>
            <div class="table-wrap">
              <table>
                <thead>
                  <tr><th>Date</th><th>Customer</th><th>Gem</th><th>Total</th><th>Paid</th><th>Balance</th><th>Actions</th></tr>
                </thead>
                <tbody id="salesBody"></tbody>
              </table>
            </div>
          </div>

          <form id="saleForm" class="panel">
            <div class="panel-header"><h3 id="saleFormTitle">Add Sale</h3></div>
            <div class="panel-body form-grid">
              <input id="saleId" type="hidden">
              <label>Date<input id="saleDate" type="date" required></label>
              <label>Customer<select id="saleCustomer" required></select></label>
              <label class="wide">Gem<select id="saleGem" required></select></label>
              <label>Total amount<input id="saleAmount" type="number" min="0" step="0.01" required></label>
              <label>Paid amount<input id="salePaid" type="number" min="0" step="0.01"></label>
              <label class="wide">Notes<textarea id="saleNotes"></textarea></label>
              <button class="btn primary wide" type="submit">Save Sale</button>
            </div>
          </form>
        </div>
      </section>

      <section id="expenses" class="section">
        <div class="topline">
          <div>
            <h2>Expenses</h2>
            <p class="muted">Track certification, shipping, office, travel, and other costs.</p>
          </div>
        </div>
        <div class="photo-banner banner-expenses"><span>Track costs that affect real profit</span></div>

        <div class="work-grid">
          <div class="panel">
            <div class="panel-header"><h3>Expense Register</h3></div>
            <div class="table-wrap">
              <table>
                <thead>
                  <tr><th>Date</th><th>Category</th><th>Description</th><th>Amount</th><th>Actions</th></tr>
                </thead>
                <tbody id="expensesBody"></tbody>
              </table>
            </div>
          </div>

          <form id="expenseForm" class="panel">
            <div class="panel-header"><h3 id="expenseFormTitle">Add Expense</h3></div>
            <div class="panel-body form-grid">
              <input id="expenseId" type="hidden">
              <label>Date<input id="expenseDate" type="date" required></label>
              <label>Category<select id="expenseCategory"><option>Certification</option><option>Shipping</option><option>Office</option><option>Travel</option><option>Marketing</option><option>Other</option></select></label>
              <label class="wide">Description<input id="expenseDescription" required></label>
              <label class="wide">Amount<input id="expenseAmount" type="number" min="0" step="0.01" required></label>
              <button class="btn primary wide" type="submit">Save Expense</button>
            </div>
          </form>
        </div>
      </section>

      <section id="reports" class="section">
        <div class="topline">
          <div>
            <h2>Reports</h2>
            <p class="muted">Summary of stock, revenue, profit estimate, and dues.</p>
          </div>
        </div>
        <div class="photo-banner banner-reports"><span>Review stock value, revenue, expenses, and profit</span></div>

        <div class="stats-grid">
          <article class="stat"><span>Revenue</span><strong id="reportRevenue">0</strong></article>
          <article class="stat"><span>Paid Collected</span><strong id="reportPaid">0</strong></article>
          <article class="stat"><span>Expenses</span><strong id="reportExpenses">0</strong></article>
          <article class="stat"><span>Estimated Profit</span><strong id="reportProfit">0</strong></article>
        </div>

        <div class="panel">
          <div class="panel-header">
            <h3>Inventory by Type</h3>
            <button id="printBtn" class="btn">Print</button>
          </div>
          <div class="table-wrap">
            <table>
              <thead>
                <tr><th>Gem Type</th><th>Pieces</th><th>Total Carat</th><th>Stock Value</th></tr>
              </thead>
              <tbody id="typeReportBody"></tbody>
            </table>
          </div>
        </div>
      </section>

      <section id="settings" class="section">
        <div class="topline">
          <div>
            <h2>Settings</h2>
            <p class="muted">Store profile, login, backup, and restore controls.</p>
          </div>
        </div>
        <div class="photo-banner banner-settings"><span>Business settings, rate book, login, and backup</span></div>

        <div class="settings-grid">
          <form id="profileForm" class="panel">
            <div class="panel-header"><h3>Business Profile</h3></div>
            <div class="panel-body form-grid">
              <label class="wide">Store name<input id="profileStore"></label>
              <label>Currency symbol<input id="profileCurrency" maxlength="4"></label>
              <label>Owner<input id="profileOwner"></label>
              <label>Email<input id="profileEmail" type="email"></label>
              <label>Phone<input id="profilePhone"></label>
              <label class="wide">Address<textarea id="profileAddress"></textarea></label>
              <button class="btn primary wide" type="submit">Save Profile</button>
            </div>
          </form>

          <form id="loginSettingsForm" class="panel">
            <div class="panel-header"><h3>Login Details</h3></div>
            <div class="panel-body form-grid">
              <label class="wide">User name<input id="settingsUser" required></label>
              <label class="wide">Password<input id="settingsPass" type="password" required></label>
              <button class="btn primary wide" type="submit">Update Login</button>
            </div>
          </form>

          <form id="rateForm" class="panel">
            <div class="panel-header"><h3>Rate Book</h3></div>
            <div class="panel-body form-grid">
              <input id="rateId" type="hidden">
              <label>Gem type<input id="rateType" placeholder="Ruby" required></label>
              <label>Rate per carat<input id="ratePerCarat" type="number" min="0" step="0.01" required></label>
              <label>Margin percent<input id="rateMargin" type="number" min="0" step="0.01" value="0"></label>
              <label>Currency note<input id="rateNote" placeholder="Wholesale / retail / market"></label>
              <button class="btn primary wide" type="submit">Save Rate</button>
              <div class="wide table-wrap">
                <table>
                  <thead><tr><th>Gem Type</th><th>Rate / Ct</th><th>Margin</th><th>Actions</th></tr></thead>
                  <tbody id="ratesBody"></tbody>
                </table>
              </div>
            </div>
          </form>

          <div class="panel">
            <div class="panel-header"><h3>Backup Data</h3></div>
            <div class="panel-body actions">
              <button id="exportBtn" class="btn success">Export JSON</button>
              <label class="file-input">
                Restore JSON
                <input id="importFile" type="file" accept="application/json">
              </label>
            </div>
          </div>

          <div class="panel danger-zone">
            <div class="panel-header"><h3>Danger Zone</h3></div>
            <div class="panel-body">
              <button id="resetBtn" class="btn danger">Reset All Data</button>
            </div>
          </div>
        </div>
      </section>
    </main>
  </section>

  <script>
    const STORAGE_KEY = "gemledger.data.v1";
    const SESSION_KEY = "gemledger.session";
    const gemPhotos = {
      ruby: "https://images.unsplash.com/photo-1617038260897-41a1f14a8ca0?auto=format&fit=crop&w=500&q=80",
      sapphire: "https://images.unsplash.com/photo-1605100804763-247f67b3557e?auto=format&fit=crop&w=500&q=80",
      emerald: "https://images.unsplash.com/photo-1601121141461-9d6647bca1ed?auto=format&fit=crop&w=500&q=80",
      diamond: "https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?auto=format&fit=crop&w=500&q=80",
      opal: "https://images.unsplash.com/photo-1515377905703-c4788e51af15?auto=format&fit=crop&w=500&q=80",
      pearl: "https://images.unsplash.com/photo-1602173574767-37ac01994b2a?auto=format&fit=crop&w=500&q=80",
      amethyst: "https://images.unsplash.com/photo-1615485290382-441e4d049cb5?auto=format&fit=crop&w=500&q=80",
      default: "https://images.unsplash.com/photo-1573408301185-9146fe634ad0?auto=format&fit=crop&w=500&q=80"
    };

    const defaultData = {
      auth: { user: "admin", pass: "admin123" },
      profile: {
        store: "Hunter Gems",
        currency: "$",
        owner: "Owner",
        email: "hunter108kin@gmail.com",
        phone: "8791753303",
        address: "1110 Malhupura, Muzaffarnagar"
      },
      rates: [
        { id: crypto.randomUUID(), type: "Ruby", rate: 2100, margin: 18, note: "Retail" },
        { id: crypto.randomUUID(), type: "Sapphire", rate: 1900, margin: 15, note: "Retail" },
        { id: crypto.randomUUID(), type: "Emerald", rate: 1600, margin: 20, note: "Retail" }
      ],
      gems: [
        {
          id: crypto.randomUUID(),
          code: "RB-001",
          type: "Ruby",
          weight: 2.45,
          shape: "Oval",
          color: "Pigeon red",
          clarity: "Eye clean",
          certificate: "GIA",
          status: "In Stock",
          cost: 3200,
          price: 5100,
          notes: "Fine color, heated"
        },
        {
          id: crypto.randomUUID(),
          code: "SP-014",
          type: "Sapphire",
          weight: 3.1,
          shape: "Cushion",
          color: "Royal blue",
          clarity: "VS",
          certificate: "IGI",
          status: "On Hold",
          cost: 4100,
          price: 6900,
          notes: "Client requested inspection"
        }
      ],
      customers: [
        { id: crypto.randomUUID(), name: "Aarav Jewels", type: "Buyer", phone: "+91 90000 00000", email: "buyer@example.com", address: "Mumbai" }
      ],
      sales: [],
      expenses: [],
      activity: []
    };

    let data = loadData();
    let currentSection = "dashboard";

    const $ = (selector) => document.querySelector(selector);
    const $$ = (selector) => Array.from(document.querySelectorAll(selector));

    function loadData() {
      const saved = localStorage.getItem(STORAGE_KEY);
      if (!saved) {
        return structuredClone(defaultData);
      }

      try {
        return { ...structuredClone(defaultData), ...JSON.parse(saved) };
      } catch {
        return structuredClone(defaultData);
      }
    }

    function applyProfessionalDefaults() {
      data.profile ||= {};
      if (!data.profile.store || data.profile.store === "Gems Dealer") data.profile.store = "Hunter Gems";
      data.profile.email ||= "hunter108kin@gmail.com";
      data.profile.phone ||= "8791753303";
      data.profile.address ||= "1110 Malhupura, Muzaffarnagar";
      saveData();
    }

    function saveData() {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
    }

    function money(value) {
      const amount = Number(value || 0);
      return `${data.profile.currency || "$"}${amount.toLocaleString(undefined, { maximumFractionDigits: 2 })}`;
    }

    function number(value) {
      return Number(value || 0).toLocaleString(undefined, { maximumFractionDigits: 2 });
    }

    function today() {
      return new Date().toISOString().slice(0, 10);
    }

    function showMessage(text) {
      const message = $("#message");
      message.textContent = text;
      message.classList.remove("hidden");
      setTimeout(() => message.classList.add("hidden"), 2600);
    }

    function addActivity(text) {
      data.activity.unshift({ id: crypto.randomUUID(), text, at: new Date().toLocaleString() });
      data.activity = data.activity.slice(0, 12);
      saveData();
    }

    function switchSection(section) {
      currentSection = section;
      $$(".section").forEach((node) => node.classList.toggle("active", node.id === section));
      $$(".nav-button").forEach((node) => node.classList.toggle("active", node.dataset.section === section));
      render();
    }

    function getGem(id) {
      return data.gems.find((gem) => gem.id === id);
    }

    function getCustomer(id) {
      return data.customers.find((customer) => customer.id === id);
    }

    function getRateForType(type) {
      const cleanType = String(type || "").trim().toLowerCase();
      return data.rates.find((rate) => rate.type.trim().toLowerCase() === cleanType);
    }

    function calculateRatePrice(type, weight) {
      const rate = getRateForType(type);
      if (!rate || !Number(weight)) return null;
      const base = Number(weight) * Number(rate.rate || 0);
      const margin = base * (Number(rate.margin || 0) / 100);
      return {
        rate,
        base,
        price: Number((base + margin).toFixed(2))
      };
    }

    function statusClass(status) {
      if (status === "Sold") return "sold";
      if (status === "On Hold") return "hold";
      if (status === "Memo") return "memo";
      return "stock";
    }

    function gemPhoto(type) {
      const cleanType = String(type || "").toLowerCase();
      return Object.entries(gemPhotos).find(([key]) => key !== "default" && cleanType.includes(key))?.[1] || gemPhotos.default;
    }

    function escapeHtml(value) {
      return String(value ?? "").replace(/[&<>"']/g, (char) => ({
        "&": "&amp;",
        "<": "&lt;",
        ">": "&gt;",
        "\"": "&quot;",
        "'": "&#039;"
      }[char]));
    }

    function fillSelect(select, items, getValue, getText, placeholder) {
      select.innerHTML = placeholder ? `<option value="">${placeholder}</option>` : "";
      select.innerHTML += items.map((item) => `<option value="${escapeHtml(getValue(item))}">${escapeHtml(getText(item))}</option>`).join("");
    }

    function renderDashboard() {
      const availableGems = data.gems.filter((gem) => gem.status !== "Sold");
      const stockValue = availableGems.reduce((sum, gem) => sum + Number(gem.price || 0), 0);
      const salesTotal = data.sales.reduce((sum, sale) => sum + Number(sale.amount || 0), 0);
      const balance = data.sales.reduce((sum, sale) => sum + Math.max(Number(sale.amount || 0) - Number(sale.paid || 0), 0), 0);

      $("#todayText").textContent = new Date().toLocaleDateString();
      $("#statStockValue").textContent = money(stockValue);
      $("#statPieces").textContent = availableGems.length;
      $("#statSales").textContent = money(salesTotal);
      $("#statBalance").textContent = money(balance);
      const galleryItems = [
        ["Ruby", gemPhotos.ruby],
        ["Sapphire", gemPhotos.sapphire],
        ["Emerald", gemPhotos.emerald],
        ["Diamond", gemPhotos.diamond]
      ];
      $("#gemGallery").innerHTML = galleryItems.map(([label, image]) => (
        `<article class="gem-photo-card" style="background-image:url('${image}')"><span>${label}</span></article>`
      )).join("");

      const recent = [...data.sales].sort((a, b) => b.date.localeCompare(a.date)).slice(0, 6);
      $("#recentSalesBody").innerHTML = recent.length ? recent.map((sale) => {
        const customer = getCustomer(sale.customerId);
        const gem = getGem(sale.gemId);
        return `<tr><td>${escapeHtml(sale.date)}</td><td>${escapeHtml(customer?.name || "Deleted")}</td><td>${escapeHtml(gem?.code || "Deleted")}</td><td>${money(sale.amount)}</td><td>${money(sale.paid)}</td></tr>`;
      }).join("") : `<tr><td colspan="5" class="empty">No sales recorded yet.</td></tr>`;

      $("#activityList").innerHTML = data.activity.length ? data.activity.map((item) => (
        `<div class="activity-item"><strong>${escapeHtml(item.text)}</strong><span class="muted">${escapeHtml(item.at)}</span></div>`
      )).join("") : `<div class="empty">No activity yet.</div>`;
    }

    function renderInventory() {
      const search = $("#gemSearch").value.trim().toLowerCase();
      const status = $("#gemStatusFilter").value;
      const type = $("#gemTypeFilter").value;
      const types = [...new Set(data.gems.map((gem) => gem.type).filter(Boolean))].sort();
      fillSelect($("#gemTypeFilter"), types, (item) => item, (item) => item, "All gem types");
      $("#gemTypeFilter").value = type;

      const rows = data.gems.filter((gem) => {
        const matchesSearch = [gem.code, gem.type, gem.color, gem.shape, gem.certificate].join(" ").toLowerCase().includes(search);
        return matchesSearch && (!status || gem.status === status) && (!type || gem.type === type);
      });

      $("#inventoryBody").innerHTML = rows.length ? rows.map((gem) => `
        <tr>
          <td><strong>${escapeHtml(gem.code)}</strong></td>
          <td>
            <div class="gem-cell">
              <img class="gem-thumb" src="${gemPhoto(gem.type)}" alt="${escapeHtml(gem.type)}">
              <span>${escapeHtml(gem.type)}<br><span class="muted">${escapeHtml(gem.shape || "")}</span></span>
            </div>
          </td>
          <td>${number(gem.weight)} ct</td>
          <td>${escapeHtml(gem.color || "-")}</td>
          <td><span class="status ${statusClass(gem.status)}">${escapeHtml(gem.status)}</span></td>
          <td>${money(gem.cost)}</td>
          <td>${money(gem.price)}</td>
          <td class="row-actions">
            <button class="icon-btn" title="Edit" data-edit-gem="${gem.id}">Edit</button>
            <button class="icon-btn" title="Delete" data-delete-gem="${gem.id}">Del</button>
          </td>
        </tr>
      `).join("") : `<tr><td colspan="8" class="empty">No gems found.</td></tr>`;
    }

    function renderCustomers() {
      const search = $("#customerSearch").value.trim().toLowerCase();
      const rows = data.customers.filter((customer) => [customer.name, customer.phone, customer.email, customer.type].join(" ").toLowerCase().includes(search));

      $("#customersBody").innerHTML = rows.length ? rows.map((customer) => {
        const balance = data.sales
          .filter((sale) => sale.customerId === customer.id)
          .reduce((sum, sale) => sum + Number(sale.amount || 0) - Number(sale.paid || 0), 0);

        return `
          <tr>
            <td><strong>${escapeHtml(customer.name)}</strong><br><span class="muted">${escapeHtml(customer.address || "")}</span></td>
            <td>${escapeHtml(customer.type)}</td>
            <td>${escapeHtml(customer.phone || "-")}</td>
            <td>${escapeHtml(customer.email || "-")}</td>
            <td>${money(balance)}</td>
            <td class="row-actions">
              <button class="icon-btn" title="Edit" data-edit-customer="${customer.id}">Edit</button>
              <button class="icon-btn" title="Delete" data-delete-customer="${customer.id}">Del</button>
            </td>
          </tr>
        `;
      }).join("") : `<tr><td colspan="6" class="empty">No customers found.</td></tr>`;
    }

    function renderSales() {
      fillSelect($("#saleCustomer"), data.customers, (item) => item.id, (item) => `${item.name} (${item.type})`, "Select customer");
      const saleId = $("#saleId").value;
      const editingSale = data.sales.find((sale) => sale.id === saleId);
      const availableGems = data.gems.filter((gem) => gem.status !== "Sold" || gem.id === editingSale?.gemId);
      fillSelect($("#saleGem"), availableGems, (item) => item.id, (item) => `${item.code} - ${item.type} - ${money(item.price)}`, "Select gem");

      if (editingSale) {
        $("#saleCustomer").value = editingSale.customerId;
        $("#saleGem").value = editingSale.gemId;
      }

      const rows = [...data.sales].sort((a, b) => b.date.localeCompare(a.date));
      $("#salesBody").innerHTML = rows.length ? rows.map((sale) => {
        const customer = getCustomer(sale.customerId);
        const gem = getGem(sale.gemId);
        const balance = Number(sale.amount || 0) - Number(sale.paid || 0);
        return `
          <tr>
            <td>${escapeHtml(sale.date)}</td>
            <td>${escapeHtml(customer?.name || "Deleted")}</td>
            <td>${escapeHtml(gem ? `${gem.code} - ${gem.type}` : "Deleted")}</td>
            <td>${money(sale.amount)}</td>
            <td>${money(sale.paid)}</td>
            <td>${money(balance)}</td>
            <td class="row-actions">
              <button class="icon-btn" title="Edit" data-edit-sale="${sale.id}">Edit</button>
              <button class="icon-btn" title="Delete" data-delete-sale="${sale.id}">Del</button>
            </td>
          </tr>
        `;
      }).join("") : `<tr><td colspan="7" class="empty">No sales recorded yet.</td></tr>`;
    }

    function renderExpenses() {
      const rows = [...data.expenses].sort((a, b) => b.date.localeCompare(a.date));
      $("#expensesBody").innerHTML = rows.length ? rows.map((expense) => `
        <tr>
          <td>${escapeHtml(expense.date)}</td>
          <td>${escapeHtml(expense.category)}</td>
          <td>${escapeHtml(expense.description)}</td>
          <td>${money(expense.amount)}</td>
          <td class="row-actions">
            <button class="icon-btn" title="Edit" data-edit-expense="${expense.id}">Edit</button>
            <button class="icon-btn" title="Delete" data-delete-expense="${expense.id}">Del</button>
          </td>
        </tr>
      `).join("") : `<tr><td colspan="5" class="empty">No expenses recorded yet.</td></tr>`;
    }

    function renderReports() {
      const revenue = data.sales.reduce((sum, sale) => sum + Number(sale.amount || 0), 0);
      const paid = data.sales.reduce((sum, sale) => sum + Number(sale.paid || 0), 0);
      const expenses = data.expenses.reduce((sum, expense) => sum + Number(expense.amount || 0), 0);
      const soldCost = data.sales.reduce((sum, sale) => sum + Number(getGem(sale.gemId)?.cost || 0), 0);
      const profit = revenue - soldCost - expenses;

      $("#reportRevenue").textContent = money(revenue);
      $("#reportPaid").textContent = money(paid);
      $("#reportExpenses").textContent = money(expenses);
      $("#reportProfit").textContent = money(profit);

      const grouped = data.gems.reduce((acc, gem) => {
        const key = gem.type || "Unknown";
        acc[key] ||= { pieces: 0, weight: 0, value: 0 };
        if (gem.status !== "Sold") {
          acc[key].pieces += 1;
          acc[key].weight += Number(gem.weight || 0);
          acc[key].value += Number(gem.price || 0);
        }
        return acc;
      }, {});

      const rows = Object.entries(grouped);
      $("#typeReportBody").innerHTML = rows.length ? rows.map(([type, item]) => `
        <tr><td>${escapeHtml(type)}</td><td>${item.pieces}</td><td>${number(item.weight)} ct</td><td>${money(item.value)}</td></tr>
      `).join("") : `<tr><td colspan="4" class="empty">No report data yet.</td></tr>`;
    }

    function renderSettings() {
      $("#profileStore").value = data.profile.store || "";
      $("#profileCurrency").value = data.profile.currency || "$";
      $("#profileOwner").value = data.profile.owner || "";
      $("#profileEmail").value = data.profile.email || "hunter108kin@gmail.com";
      $("#profilePhone").value = data.profile.phone || "8791753303";
      $("#profileAddress").value = data.profile.address || "1110 Malhupura, Muzaffarnagar";
      $("#settingsUser").value = data.auth.user || "";
      $("#settingsPass").value = data.auth.pass || "";
      renderRates();
    }

    function renderRates() {
      $("#ratesBody").innerHTML = data.rates.length ? data.rates.map((rate) => `
        <tr>
          <td><strong>${escapeHtml(rate.type)}</strong><br><span class="muted">${escapeHtml(rate.note || "")}</span></td>
          <td>${money(rate.rate)}</td>
          <td>${number(rate.margin)}%</td>
          <td class="row-actions">
            <button class="icon-btn" title="Edit" data-edit-rate="${rate.id}">Edit</button>
            <button class="icon-btn" title="Delete" data-delete-rate="${rate.id}">Del</button>
          </td>
        </tr>
      `).join("") : `<tr><td colspan="4" class="empty">No rates saved yet.</td></tr>`;
    }

    function updateRatePreview() {
      const result = calculateRatePrice($("#gemType").value, $("#gemWeight").value);
      const preview = $("#ratePreview");
      if (!result) {
        preview.classList.add("hidden");
        $("#gemRate").value = "";
        return null;
      }

      $("#gemRate").value = result.rate.rate;
      preview.textContent = `${result.rate.type}: ${money(result.rate.rate)} / ct + ${number(result.rate.margin)}% margin = ${money(result.price)}`;
      preview.classList.remove("hidden");
      return result;
    }

    function renderProfile() {
      $("#storeNameSide").textContent = data.profile.store || "Gems Dealer";
      $("#businessStripName").textContent = data.profile.store || "Hunter Gems";
      $("#businessStripContact").textContent = `${data.profile.email || "hunter108kin@gmail.com"} | ${data.profile.phone || "8791753303"} | ${data.profile.address || "1110 Malhupura, Muzaffarnagar"}`;
      $("#dealerContactSide").innerHTML = `
        ${escapeHtml(data.profile.email || "hunter108kin@gmail.com")}<br>
        ${escapeHtml(data.profile.phone || "8791753303")}<br>
        ${escapeHtml(data.profile.address || "1110 Malhupura, Muzaffarnagar")}
      `;
    }

    function render() {
      renderProfile();
      renderDashboard();
      renderInventory();
      renderCustomers();
      renderSales();
      renderExpenses();
      renderReports();
      if (currentSection === "settings") renderSettings();
    }

    function resetGemForm() {
      $("#gemForm").reset();
      $("#gemId").value = "";
      $("#gemFormTitle").textContent = "Add Gem";
      $("#gemCode").value = `GM-${String(data.gems.length + 1).padStart(3, "0")}`;
      $("#ratePreview").classList.add("hidden");
    }

    function resetCustomerForm() {
      $("#customerForm").reset();
      $("#customerId").value = "";
      $("#customerFormTitle").textContent = "Add Customer";
    }

    function resetSaleForm() {
      $("#saleForm").reset();
      $("#saleId").value = "";
      $("#saleFormTitle").textContent = "Add Sale";
      $("#saleDate").value = today();
      renderSales();
    }

    function resetExpenseForm() {
      $("#expenseForm").reset();
      $("#expenseId").value = "";
      $("#expenseFormTitle").textContent = "Add Expense";
      $("#expenseDate").value = today();
    }

    $("#loginForm").addEventListener("submit", (event) => {
      event.preventDefault();
      if ($("#loginUser").value.trim() === data.auth.user && $("#loginPass").value.trim() === data.auth.pass) {
        sessionStorage.setItem(SESSION_KEY, "true");
        $("#loginError").classList.add("hidden");
        $("#loginView").classList.add("hidden");
        $("#appView").classList.remove("hidden");
        render();
        return;
      }
      $("#loginError").classList.remove("hidden");
    });

    $("#resetLoginBtn").addEventListener("click", () => {
      data.auth = { user: "admin", pass: "admin123" };
      saveData();
      $("#loginUser").value = "admin";
      $("#loginPass").value = "admin123";
      $("#loginError").classList.add("hidden");
    });

    $("#logoutBtn").addEventListener("click", () => {
      sessionStorage.removeItem(SESSION_KEY);
      $("#appView").classList.add("hidden");
      $("#loginView").classList.remove("hidden");
    });

    $("#navList").addEventListener("click", (event) => {
      const button = event.target.closest("[data-section]");
      if (button) switchSection(button.dataset.section);
    });

    document.body.addEventListener("click", (event) => {
      const jump = event.target.closest("[data-section-jump]");
      if (jump) switchSection(jump.dataset.sectionJump);

      const editGem = event.target.closest("[data-edit-gem]");
      if (editGem) {
        const gem = getGem(editGem.dataset.editGem);
        if (!gem) return;
        $("#gemFormTitle").textContent = "Edit Gem";
        $("#gemId").value = gem.id;
        $("#gemCode").value = gem.code;
        $("#gemType").value = gem.type;
        $("#gemWeight").value = gem.weight;
        $("#gemShape").value = gem.shape;
        $("#gemColor").value = gem.color;
        $("#gemClarity").value = gem.clarity;
        $("#gemCertificate").value = gem.certificate;
        $("#gemStatus").value = gem.status;
        $("#gemCost").value = gem.cost;
        $("#gemPrice").value = gem.price;
        $("#gemRate").value = gem.ratePerCarat || "";
        $("#gemNotes").value = gem.notes;
        updateRatePreview();
      }

      const deleteGem = event.target.closest("[data-delete-gem]");
      if (deleteGem && confirm("Delete this gem record?")) {
        data.gems = data.gems.filter((gem) => gem.id !== deleteGem.dataset.deleteGem);
        saveData();
        addActivity("Gem record deleted");
        render();
      }

      const editCustomer = event.target.closest("[data-edit-customer]");
      if (editCustomer) {
        const customer = getCustomer(editCustomer.dataset.editCustomer);
        if (!customer) return;
        $("#customerFormTitle").textContent = "Edit Customer";
        $("#customerId").value = customer.id;
        $("#customerName").value = customer.name;
        $("#customerType").value = customer.type;
        $("#customerPhone").value = customer.phone;
        $("#customerEmail").value = customer.email;
        $("#customerAddress").value = customer.address;
      }

      const deleteCustomer = event.target.closest("[data-delete-customer]");
      if (deleteCustomer && confirm("Delete this customer record?")) {
        data.customers = data.customers.filter((customer) => customer.id !== deleteCustomer.dataset.deleteCustomer);
        saveData();
        addActivity("Customer record deleted");
        render();
      }

      const editSale = event.target.closest("[data-edit-sale]");
      if (editSale) {
        const sale = data.sales.find((item) => item.id === editSale.dataset.editSale);
        if (!sale) return;
        $("#saleFormTitle").textContent = "Edit Sale";
        $("#saleId").value = sale.id;
        $("#saleDate").value = sale.date;
        $("#saleAmount").value = sale.amount;
        $("#salePaid").value = sale.paid;
        $("#saleNotes").value = sale.notes;
        renderSales();
      }

      const deleteSale = event.target.closest("[data-delete-sale]");
      if (deleteSale && confirm("Delete this sale record?")) {
        const sale = data.sales.find((item) => item.id === deleteSale.dataset.deleteSale);
        const gem = getGem(sale?.gemId);
        if (gem) gem.status = "In Stock";
        data.sales = data.sales.filter((item) => item.id !== deleteSale.dataset.deleteSale);
        saveData();
        addActivity("Sale record deleted");
        render();
      }

      const editExpense = event.target.closest("[data-edit-expense]");
      if (editExpense) {
        const expense = data.expenses.find((item) => item.id === editExpense.dataset.editExpense);
        if (!expense) return;
        $("#expenseFormTitle").textContent = "Edit Expense";
        $("#expenseId").value = expense.id;
        $("#expenseDate").value = expense.date;
        $("#expenseCategory").value = expense.category;
        $("#expenseDescription").value = expense.description;
        $("#expenseAmount").value = expense.amount;
      }

      const deleteExpense = event.target.closest("[data-delete-expense]");
      if (deleteExpense && confirm("Delete this expense record?")) {
        data.expenses = data.expenses.filter((item) => item.id !== deleteExpense.dataset.deleteExpense);
        saveData();
        addActivity("Expense record deleted");
        render();
      }

      const editRate = event.target.closest("[data-edit-rate]");
      if (editRate) {
        const rate = data.rates.find((item) => item.id === editRate.dataset.editRate);
        if (!rate) return;
        $("#rateId").value = rate.id;
        $("#rateType").value = rate.type;
        $("#ratePerCarat").value = rate.rate;
        $("#rateMargin").value = rate.margin;
        $("#rateNote").value = rate.note;
      }

      const deleteRate = event.target.closest("[data-delete-rate]");
      if (deleteRate && confirm("Delete this rate?")) {
        data.rates = data.rates.filter((item) => item.id !== deleteRate.dataset.deleteRate);
        saveData();
        addActivity("Rate deleted");
        renderSettings();
      }
    });

    $("#gemForm").addEventListener("submit", (event) => {
      event.preventDefault();
      const id = $("#gemId").value || crypto.randomUUID();
      const gem = {
        id,
        code: $("#gemCode").value.trim(),
        type: $("#gemType").value.trim(),
        weight: Number($("#gemWeight").value),
        shape: $("#gemShape").value.trim(),
        color: $("#gemColor").value.trim(),
        clarity: $("#gemClarity").value.trim(),
        certificate: $("#gemCertificate").value.trim(),
        status: $("#gemStatus").value,
        cost: Number($("#gemCost").value || 0),
        ratePerCarat: Number($("#gemRate").value || 0),
        price: Number($("#gemPrice").value || 0),
        notes: $("#gemNotes").value.trim()
      };

      const index = data.gems.findIndex((item) => item.id === id);
      if (index >= 0) data.gems[index] = gem;
      else data.gems.push(gem);
      saveData();
      addActivity(`${gem.code} saved in inventory`);
      resetGemForm();
      render();
      showMessage("Gem saved.");
    });

    $("#customerForm").addEventListener("submit", (event) => {
      event.preventDefault();
      const id = $("#customerId").value || crypto.randomUUID();
      const customer = {
        id,
        name: $("#customerName").value.trim(),
        type: $("#customerType").value,
        phone: $("#customerPhone").value.trim(),
        email: $("#customerEmail").value.trim(),
        address: $("#customerAddress").value.trim()
      };

      const index = data.customers.findIndex((item) => item.id === id);
      if (index >= 0) data.customers[index] = customer;
      else data.customers.push(customer);
      saveData();
      addActivity(`${customer.name} saved`);
      resetCustomerForm();
      render();
      showMessage("Customer saved.");
    });

    $("#saleForm").addEventListener("submit", (event) => {
      event.preventDefault();
      const id = $("#saleId").value || crypto.randomUUID();
      const oldSale = data.sales.find((item) => item.id === id);
      if (oldSale && oldSale.gemId !== $("#saleGem").value) {
        const oldGem = getGem(oldSale.gemId);
        if (oldGem) oldGem.status = "In Stock";
      }

      const sale = {
        id,
        date: $("#saleDate").value,
        customerId: $("#saleCustomer").value,
        gemId: $("#saleGem").value,
        amount: Number($("#saleAmount").value || 0),
        paid: Number($("#salePaid").value || 0),
        notes: $("#saleNotes").value.trim()
      };

      const gem = getGem(sale.gemId);
      if (gem) gem.status = "Sold";

      const index = data.sales.findIndex((item) => item.id === id);
      if (index >= 0) data.sales[index] = sale;
      else data.sales.push(sale);
      saveData();
      addActivity(`Sale saved for ${getCustomer(sale.customerId)?.name || "customer"}`);
      resetSaleForm();
      render();
      showMessage("Sale saved.");
    });

    $("#saleGem").addEventListener("change", () => {
      const gem = getGem($("#saleGem").value);
      if (gem && !$("#saleAmount").value) $("#saleAmount").value = gem.price || 0;
    });

    $("#expenseForm").addEventListener("submit", (event) => {
      event.preventDefault();
      const id = $("#expenseId").value || crypto.randomUUID();
      const expense = {
        id,
        date: $("#expenseDate").value,
        category: $("#expenseCategory").value,
        description: $("#expenseDescription").value.trim(),
        amount: Number($("#expenseAmount").value || 0)
      };

      const index = data.expenses.findIndex((item) => item.id === id);
      if (index >= 0) data.expenses[index] = expense;
      else data.expenses.push(expense);
      saveData();
      addActivity(`Expense saved: ${expense.category}`);
      resetExpenseForm();
      render();
      showMessage("Expense saved.");
    });

    $("#rateForm").addEventListener("submit", (event) => {
      event.preventDefault();
      const id = $("#rateId").value || crypto.randomUUID();
      const rate = {
        id,
        type: $("#rateType").value.trim(),
        rate: Number($("#ratePerCarat").value || 0),
        margin: Number($("#rateMargin").value || 0),
        note: $("#rateNote").value.trim()
      };

      const index = data.rates.findIndex((item) => item.id === id);
      if (index >= 0) data.rates[index] = rate;
      else data.rates.push(rate);
      saveData();
      addActivity(`${rate.type} rate saved`);
      $("#rateForm").reset();
      $("#rateId").value = "";
      $("#rateMargin").value = 0;
      renderSettings();
      showMessage("Rate saved.");
    });

    $("#applyRateBtn").addEventListener("click", () => {
      const result = updateRatePreview();
      if (!result) {
        showMessage("Add this gem type in the Rate Book first.");
        return;
      }
      $("#gemPrice").value = result.price;
      showMessage("Rate book price applied.");
    });

    ["gemType", "gemWeight"].forEach((id) => {
      $(`#${id}`).addEventListener("input", updateRatePreview);
    });

    $("#profileForm").addEventListener("submit", (event) => {
      event.preventDefault();
      data.profile.store = $("#profileStore").value.trim() || "Gems Dealer";
      data.profile.currency = $("#profileCurrency").value.trim() || "$";
      data.profile.owner = $("#profileOwner").value.trim();
      data.profile.email = $("#profileEmail").value.trim();
      data.profile.phone = $("#profilePhone").value.trim();
      data.profile.address = $("#profileAddress").value.trim();
      saveData();
      render();
      showMessage("Profile saved.");
    });

    $("#loginSettingsForm").addEventListener("submit", (event) => {
      event.preventDefault();
      data.auth.user = $("#settingsUser").value.trim();
      data.auth.pass = $("#settingsPass").value;
      saveData();
      showMessage("Login updated.");
    });

    $("#clearGemForm").addEventListener("click", resetGemForm);
    ["gemSearch", "gemStatusFilter", "gemTypeFilter", "customerSearch"].forEach((id) => {
      $(`#${id}`).addEventListener("input", render);
      $(`#${id}`).addEventListener("change", render);
    });

    $("#printBtn").addEventListener("click", () => window.print());

    $("#exportBtn").addEventListener("click", () => {
      const blob = new Blob([JSON.stringify(data, null, 2)], { type: "application/json" });
      const url = URL.createObjectURL(blob);
      const link = document.createElement("a");
      link.href = url;
      link.download = `gemledger-backup-${today()}.json`;
      link.click();
      URL.revokeObjectURL(url);
    });

    $("#importFile").addEventListener("change", (event) => {
      const file = event.target.files[0];
      if (!file) return;
      const reader = new FileReader();
      reader.onload = () => {
        try {
          data = { ...structuredClone(defaultData), ...JSON.parse(reader.result) };
          saveData();
          render();
          showMessage("Backup restored.");
        } catch {
          showMessage("Could not restore that file.");
        }
      };
      reader.readAsText(file);
    });

    $("#resetBtn").addEventListener("click", () => {
      if (!confirm("Reset all GemLedger data?")) return;
      localStorage.removeItem(STORAGE_KEY);
      data = structuredClone(defaultData);
      saveData();
      resetGemForm();
      resetCustomerForm();
      resetSaleForm();
      resetExpenseForm();
      render();
      showMessage("Data reset.");
    });

    if (sessionStorage.getItem(SESSION_KEY) === "true") {
      $("#loginView").classList.add("hidden");
      $("#appView").classList.remove("hidden");
    }

    applyProfessionalDefaults();
    resetGemForm();
    resetSaleForm();
    resetExpenseForm();
    render();

    if ("serviceWorker" in navigator && location.protocol !== "file:") {
      navigator.serviceWorker.register("./sw.js");
    }
  </script>
</body>
</html>
