import streamlit as st

st.set_page_config(
    page_title="Portfolio Page",
    page_icon="☁️",
)
col1, col2 = st.columns([3, 1])
with col2:
    st.image("images/Headshot.jpeg")
with col1:
    st.write("# Hi, I am Zach, a cloud engineer ☁️")

st.divider()
# st.sidebar.success("Select a post above.")

st.markdown(
    """
### Introduction

Welcome to my portfolio! I am a results-driven professional with a strong focus on cloud infrastructure and development. Currently, I serve as a Platform Engineer for an AI/ML team at a leading financial services firm, where I harness my skills in problem-solving and cloud engineering to design and implement innovative solutions that address complex business challenges.

Previously, I worked as a Cloud Automation Engineer at a renowned medical device company. There, I gained invaluable experience in automating cloud operations, which significantly enhanced the efficiency and scalability of the company’s cloud infrastructure.

Throughout my career, I have demonstrated a proven ability to collaborate effectively with cross-functional teams to drive operational excellence and deliver exceptional results. My passion for technology and emerging trends in cloud infrastructure fuels my commitment to optimizing performance and enhancing business growth.

### Key Skills and Expertise:

- **Cloud Engineering:** Expertise in designing, deploying, and managing scalable and secure cloud infrastructure using AWS and Azure.
- **Automation:** Highly proficient in using tools like Terraform, Ansible, and CloudFormation to automate cloud operations and deployments.
- **DevOps Practices:** Strong advocate for DevOps methodologies, including CI/CD, infrastructure as code (IaC), and continuous monitoring to ensure smooth and efficient operations.
- **Programming:** Skilled in Python, Bash, and other scripting languages to develop custom automation solutions and streamline workflows.
- **Collaboration:** Adept at working with cross-functional teams, including developers, data scientists, and business stakeholders, to deliver high-impact projects.
- **Problem-Solving:** Ability to analyze complex problems, identify root causes, and develop effective solutions that drive business value.
- **Innovation:** Passionate about exploring and implementing cutting-edge technologies to stay ahead of industry trends and deliver state-of-the-art solutions.

### Career Highlights:

- **Platform Engineer, Financial Services Firm:** Led the design and implementation of a robust cloud infrastructure that supports the data team’s analytical and operational needs, resulting in improved performance and scalability.
- **Cloud Automation Engineer, Medical Device Company:** Successfully automated cloud operations, reducing manual intervention and operational costs while improving system reliability and uptime.

My portfolio is a testament to my dedication to cloud engineering and development. It highlights my journey, projects, and the continuous pursuit of excellence in optimizing cloud infrastructure to drive business success. I invite you to explore my work and connect with me to discuss potential collaborations or opportunities.

---
"""
)

if st.button("🔋 Amazon FSX for NetApp ONTAP"):
    st.switch_page("pages/1_🔋_Amazon_FSX_for_NetApp_ONTAP.py")

if st.button("📚 Certifications"):
    st.switch_page("pages/2_📚_Certifications.py")

if st.button("📊 DataFrame_Demo"):
    st.switch_page("pages/3_📊_DataFrame_Demo.py")
