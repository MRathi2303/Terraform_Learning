#!/bin/bash
set -eux

# Update system
apt-get update -y

# Install Apache
apt-get install -y apache2

# Start & enable Apache
systemctl start apache2
systemctl enable apache2

# Create landing page
cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>3-Tier AWS Architecture</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      margin: 0;
      min-height: 100vh;
      background-color: #0f0f0f;
      color: #ffffff;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
    }
    .card {
      text-align: center;
      padding: 32px 28px 36px;
      border-radius: 14px;
      background: #111;
      max-width: 1100px;
      box-shadow: 0 10px 40px rgba(0,0,0,0.7);
      border: 1px solid #1f1f1f;
    }
    h1 {
      margin: 0 0 10px;
      font-size: 34px;
      letter-spacing: 0.2px;
    }
    p {
      color: #cfcfcf;
      line-height: 1.7;
      font-size: 16px;
      margin: 8px 0 0;
    }
    .stack {
      margin-top: 12px;
      font-size: 13px;
      color: #9aa0a6;
    }
    img {
      margin-top: 22px;
      max-width: 100%;
      border-radius: 10px;
      border: 1px solid #2a2a2a;
      background: #000;
    }
    .footer {
      margin-top: 16px;
      font-size: 12px;
      color: #7a7a7a;
    }
    .badges {
      margin-top: 10px;
      display: flex;
      gap: 8px;
      justify-content: center;
      flex-wrap: wrap;
    }
    .badge {
      font-size: 12px;
      padding: 6px 10px;
      border-radius: 999px;
      background: #1c1c1c;
      border: 1px solid #2a2a2a;
      color: #d1d1d1;
    }
  </style>
</head>
<body>
  <div class="card">
    <h1>Hello from 3-Tier App EC2 (Ubuntu)</h1>
    <p>
      This is a live, practical implementation of a scalable and highly available
      3-Tier AWS Architecture built and implemented using Terraform. 
    </p>

    <div class="badges">
      <span class="badge">AWS</span>
      <span class="badge">Terraform</span>
      <span class="badge">ALB</span>
      <span class="badge">Auto Scaling</span>
      <span class="badge">EC2</span>
      <span class="badge">RDS (Multi-AZ)</span>
      <span class="badge">Private Subnets</span>
      <span class="badge">NAT Gateway</span>
    </div>

    <img
      src="https://raw.githubusercontent.com/MRathi2303/Terraform_Learning/main/aws-3tier-terraform/documantion/AWS%203-Tier%20Arch.png"
      alt="AWS 3-Tier Architecture Diagram"
    />

    <div class="footer">
      Built using AWS & Terraform 
    </div>
  </div>
</body>
</html>
EOF


systemctl restart apache2
