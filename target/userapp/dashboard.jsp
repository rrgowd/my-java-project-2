<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevOps Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    display: flex;
    height: 100vh;
    background: #f3f4f6;
}

/* Sidebar */
.sidebar {
    width: 260px;
    background: #111827;
    color: white;
    overflow-y: auto;
    padding: 20px 0;
    transition: 0.3s;
}

.sidebar h2 {
    text-align: center;
    margin: 0;
    padding: 10px;
    font-size: 20px;
    border-bottom: 1px solid #374151;
}

/* Search */
.search-box {
    padding: 15px;
}

.search-box input {
    width: 100%;
    padding: 10px;
    border-radius: 8px;
    border: none;
    outline: none;
    font-size: 14px;
}

/* Tool list */
.tool {
    padding: 12px 20px;
    cursor: pointer;
    border-bottom: 1px solid #1f2937;
    transition: 0.3s;
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 15px;
}

.tool:hover {
    background: #1f2937;
}

.tool.active {
    background: #2563eb;
    font-weight: 600;
}

/* Main */
.main {
    flex: 1;
    display: flex;
    flex-direction: column;
}

/* Top bar */
.topbar {
    background: linear-gradient(to right, #2563eb, #1e40af);
    padding: 18px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
    box-shadow: 0 2px 15px rgba(0,0,0,0.2);
}

.topbar h3 {
    margin: 0;
    font-size: 18px;
}

/* Logout */
.logout-btn {
    background: #ef4444;
    padding: 9px 18px;
    border-radius: 8px;
    text-decoration: none;
    color: white;
    font-size: 14px;
    font-weight: 500;
    transition: 0.3s;
}

.logout-btn:hover {
    background: #dc2626;
}

/* Content */
.content {
    padding: 30px;
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Card */
.card {
    background: white;
    width: 80%;
    max-width: 850px;
    padding: 35px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.12);
    animation: fadeIn 0.5s ease-in-out;
}

.card h1 {
    margin-top: 0;
    font-size: 28px;
    color: #111827;
}

.card p {
    font-size: 16px;
    color: #4b5563;
    line-height: 1.8;
}

/* Animation */
@keyframes fadeIn {
    from {opacity: 0; transform: translateY(10px);}
    to {opacity: 1; transform: translateY(0);}
}

/* Responsive */
@media(max-width: 768px) {
    .sidebar {
        width: 200px;
    }
    .card {
        width: 95%;
    }
}
</style>

<script>
let data = {
    "Linux": "Linux is an open-source OS widely used for servers, cloud, and DevOps. It is stable, secure, and supports automation with shell scripting.",
    "Git": "Git is a distributed version control tool used to track code changes, collaborate, and manage branches for parallel development.",
    "GitHub": "GitHub is a cloud platform to host Git repositories. It supports pull requests, CI/CD workflows, and collaboration tools.",
    "Jenkins": "Jenkins is a CI/CD automation tool. It builds, tests, and deploys applications using pipelines and plugins.",
    "Docker": "Docker packages applications into containers. It ensures the same environment runs in development, testing, and production.",
    "Kubernetes": "Kubernetes orchestrates containers by managing pods, scaling, deployments, and self-healing workloads.",
    "Ansible": "Ansible automates configuration management using YAML playbooks. It is agentless and works via SSH.",
    "Helm": "Helm is a Kubernetes package manager. It installs and manages applications using charts and templates.",
    "AWS": "AWS provides cloud services like EC2, S3, RDS, IAM, VPC, and EKS for scalable infrastructure.",
    "Grafana": "Grafana creates dashboards and visualizations for monitoring systems like Prometheus, Loki, and Elasticsearch.",
    "Prometheus": "Prometheus collects metrics from applications and servers, stores time-series data, and supports alerting rules.",
    "ArgoCD": "ArgoCD is a GitOps deployment tool that continuously syncs Kubernetes resources from Git repositories.",
    "Chef": "Chef automates infrastructure using cookbooks and recipes to ensure consistent server configuration.",
    "Maven": "Maven is a Java build automation tool. It manages dependencies and builds using the pom.xml file.",
    "SonarQube": "SonarQube analyzes code quality and security, detecting bugs, vulnerabilities, and enforcing quality gates.",
    "Nexus": "Nexus is an artifact repository manager used for storing Maven builds, Docker images, npm packages, and dependencies.",
    "Terraform": "Terraform is Infrastructure as Code tool that creates cloud resources using HCL, supports state management and automation."
};

let icons = {
    "Linux": "🐧",
    "Git": "🌿",
    "GitHub": "🐙",
    "Jenkins": "🤖",
    "Docker": "🐳",
    "Kubernetes": "☸️",
    "Ansible": "⚙️",
    "Helm": "⛵",
    "AWS": "☁️",
    "Grafana": "📊",
    "Prometheus": "🔥",
    "ArgoCD": "🚀",
    "Chef": "👨‍🍳",
    "Maven": "📦",
    "SonarQube": "🔍",
    "Nexus": "🏛️",
    "Terraform": "🌍"
};

function loadTool(name, element) {
    document.getElementById("toolTitle").innerText = icons[name] + " " + name;
    document.getElementById("toolDesc").innerText = data[name];

    let tools = document.getElementsByClassName("tool");
    for (let i = 0; i < tools.length; i++) {
        tools[i].classList.remove("active");
    }
    element.classList.add("active");
}

function searchTool() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let tools = document.getElementsByClassName("tool");

    for (let i = 0; i < tools.length; i++) {
        let text = tools[i].innerText.toLowerCase();
        tools[i].style.display = text.includes(input) ? "flex" : "none";
    }
}
</script>
</head>

<body>

<div class="sidebar">
    <h2>DevOps Tools</h2>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search tool..." onkeyup="searchTool()">
    </div>

    <div class="tool" onclick="loadTool('Linux', this)">🐧 Linux</div>
    <div class="tool" onclick="loadTool('Git', this)">🌿 Git</div>
    <div class="tool" onclick="loadTool('GitHub', this)">🐙 GitHub</div>
    <div class="tool" onclick="loadTool('Jenkins', this)">🤖 Jenkins</div>
    <div class="tool" onclick="loadTool('Docker', this)">🐳 Docker</div>
    <div class="tool" onclick="loadTool('Kubernetes', this)">☸️ Kubernetes</div>
    <div class="tool" onclick="loadTool('Ansible', this)">⚙️ Ansible</div>
    <div class="tool" onclick="loadTool('Helm', this)">⛵ Helm</div>
    <div class="tool" onclick="loadTool('AWS', this)">☁️ AWS</div>
    <div class="tool" onclick="loadTool('Grafana', this)">📊 Grafana</div>
    <div class="tool" onclick="loadTool('Prometheus', this)">🔥 Prometheus</div>
    <div class="tool" onclick="loadTool('ArgoCD', this)">🚀 ArgoCD</div>
    <div class="tool" onclick="loadTool('Chef', this)">👨‍🍳 Chef</div>
    <div class="tool" onclick="loadTool('Maven', this)">📦 Maven</div>
    <div class="tool" onclick="loadTool('SonarQube', this)">🔍 SonarQube</div>
    <div class="tool" onclick="loadTool('Nexus', this)">🏛️ Nexus</div>
    <div class="tool" onclick="loadTool('Terraform', this)">🌍 Terraform</div>
</div>

<div class="main">

    <div class="topbar">
        <h3>Welcome, <%= user %> 👋</h3>
        <a href="logout" class="logout-btn">Logout</a>
    </div>

    <div class="content">
        <div class="card">
            <h1 id="toolTitle">🚀 DevOps Dashboard</h1>
            <p id="toolDesc">Select a DevOps tool from the sidebar to view its details. You can also search tools using the search box.</p>
        </div>
    </div>

</div>

</body>
</html>
