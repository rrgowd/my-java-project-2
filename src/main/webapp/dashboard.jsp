<%@ page session="true" %>
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
<title>DevOps Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    display: flex;
    height: 100vh;
    background: #f4f6f9;
}

/* Sidebar */
.sidebar {
    width: 240px;
    background: #1f2937;
    color: white;
    overflow-y: auto;
}

.sidebar h2 {
    text-align: center;
    padding: 20px 0;
    margin: 0;
    border-bottom: 1px solid #374151;
}

.tool {
    padding: 15px 20px;
    cursor: pointer;
    border-bottom: 1px solid #374151;
    transition: 0.3s;
    color: white;
}

.tool:hover {
    background: #374151;
}

/* Main Content */
.main {
    flex: 1;
    display: flex;
    flex-direction: column;
}

/* Top Bar */
.topbar {
    background: white;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.logout-btn {
    background: #ef4444;
    padding: 8px 15px;
    border-radius: 5px;
    text-decoration: none;
    color: white;
    font-size: 14px;
}

/* Content */
.content {
    padding: 40px;
    flex: 1;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.1);
}

</style>

<script>
function loadTool(name) {

    let data = {
        "Linux": "Linux is an open-source operating system used in servers.",
        "Git": "Git is a distributed version control system.",
        "GitHub": "GitHub hosts Git repositories in the cloud.",
        "Jenkins": "Jenkins automates CI/CD pipelines.",
        "Docker": "Docker packages applications into containers.",
        "Kubernetes": "Kubernetes orchestrates containers at scale.",
        "Ansible": "Ansible automates configuration management.",
        "Helm": "Helm manages Kubernetes packages.",
        "AWS": "AWS provides cloud infrastructure services.",
        "Grafana": "Grafana visualizes monitoring metrics.",
        "Prometheus": "Prometheus collects monitoring data.",
        "ArgoCD": "ArgoCD implements GitOps delivery.",
        "Chef": "Chef automates infrastructure configuration.",
        "Maven": "Maven manages project builds and dependencies.",
        "SonarQube": "SonarQube analyzes code quality.",
        "Nexus": "Nexus stores artifacts and dependencies.",
        "Terraform": "Terraform manages infrastructure as code."
    };

    document.getElementById("toolTitle").innerText = name;
    document.getElementById("toolDesc").innerText = data[name];
}
</script>
</head>

<body>

<div class="sidebar">
    <h2>DevOps Tools</h2>

    <div class="tool" onclick="loadTool('Linux')">Linux</div>
    <div class="tool" onclick="loadTool('Git')">Git</div>
    <div class="tool" onclick="loadTool('GitHub')">GitHub</div>
    <div class="tool" onclick="loadTool('Jenkins')">Jenkins</div>
    <div class="tool" onclick="loadTool('Docker')">Docker</div>
    <div class="tool" onclick="loadTool('Kubernetes')">Kubernetes</div>
    <div class="tool" onclick="loadTool('Ansible')">Ansible</div>
    <div class="tool" onclick="loadTool('Helm')">Helm</div>
    <div class="tool" onclick="loadTool('AWS')">AWS</div>
    <div class="tool" onclick="loadTool('Grafana')">Grafana</div>
    <div class="tool" onclick="loadTool('Prometheus')">Prometheus</div>
    <div class="tool" onclick="loadTool('ArgoCD')">ArgoCD</div>
    <div class="tool" onclick="loadTool('Chef')">Chef</div>
    <div class="tool" onclick="loadTool('Maven')">Maven</div>
    <div class="tool" onclick="loadTool('SonarQube')">SonarQube</div>
    <div class="tool" onclick="loadTool('Nexus')">Nexus</div>
    <div class="tool" onclick="loadTool('Terraform')">Terraform</div>
</div>

<div class="main">

    <div class="topbar">
        <h3>Welcome, <%= user %></h3>
        <a href="logout" class="logout-btn">Logout</a>
    </div>

    <div class="content">
        <div class="card">
            <h1 id="toolTitle">Select a Tool</h1>
            <p id="toolDesc">Click any DevOps tool from the left to see details here.</p>
        </div>
    </div>

</div>

</body>
</html>
