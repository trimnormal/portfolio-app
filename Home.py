"""
    Doc string 
"""

import streamlit as st
import boto3


def increment_visit_count():
    """
    Increment the visit count stored in a DynamoDB table and return the updated count.

    This function connects to a DynamoDB table named 'VisitCounter' in the 'us-east-1' region,
    increments the value of the 'Count' attribute for the item with the primary key 'visit_count',
    and returns the updated count as an integer.

    Returns:
        int: The updated visit count after incrementing by 1.

    Raises:
        boto3.exceptions.Boto3Error: If there is an error connecting to DynamoDB or
        updating the item.

    Example:
        new_count = increment_visit_count()
        print(f"Updated visit count: {new_count}")
    """
    dynamodb = boto3.resource("dynamodb", region_name="us-east-1")
    table = dynamodb.Table("VisitCounter")
    response = table.update_item(
        Key={"CounterID": "visit_count"},
        UpdateExpression="SET #count = #count + :val",
        ExpressionAttributeNames={"#count": "Count"},
        ExpressionAttributeValues={":val": 1},
        ReturnValues="UPDATED_NEW",
    )
    return int(response["Attributes"]["Count"])


def main():
    """
    Doc string
    """
    st.set_page_config(
        page_title="Portfolio Page",
        page_icon="☁️",
    )

    if "counted" not in st.session_state:
        st.session_state.counted = False
    if "count" not in st.session_state:
        st.session_state.count = 0

    col1, col2 = st.columns([3, 1])
    with col2:
        st.image("images/Headshot.jpeg")
    with col1:
        st.write("# Hi, I am Zach, a cloud engineer ☁️")
        
    col1, col2 = st.columns([2, 4])
    if st.session_state.counted is False:
        new_count = increment_visit_count()
        st.session_state.count = new_count
        st.session_state.counted = True
    with col1:
        st.metric(label="Visitor Count", value=st.session_state.count)

    with col2:
        st.markdown(
            """
            <div style="display: flex; justify-content: space-around; align-items: center;">
                <a href="https://www.linkedin.com/in/zachary-corbishley/" target="_blank" style="display: flex; align-items: center; margin: 0 20px;">
                    <img src="https://content.linkedin.com/content/dam/me/business/en-us/amp/brand-site/v2/bg/LI-Bug.svg.original.svg" width="30" height="30" style="vertical-align: middle;">
                    LinkedIn Profile
                </a>
                <a href="https://github.com/trimnormal" target="_blank" style="display: flex; align-items: center; margin: 0 20px;">
                    <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/brands/github.svg" width="30" height="30" style="vertical-align: middle;">
                    GitHub Profile
                </a>
                <a href="https://github.com/trimnormal/portfolio-app" target="_blank" style="display: flex; align-items: center; margin: 0 20px;">
                    <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/brands/github.svg" width="30" height="30" style="vertical-align: middle;">
                    Project Repository
                </a>
            </div>
            """,
            unsafe_allow_html=True,
        )
    st.divider()

    st.markdown(
        """
    ### Introduction

    Welcome to my portfolio! 
    I am a results-driven professional with a strong focus on cloud infrastructure and development. 
    Currently, I serve as a Platform Engineer for an AI/ML team at a leading financial services 
    firm, where I harness my skills in problem-solving and cloud engineering to design and implement 
    innovative solutions that address complex business challenges.

    Previously, I worked as a Cloud Automation Engineer at a renowned medical device company. 
    There, I gained invaluable experience in automating cloud operations, which 
    significantly enhanced the efficiency and scalability of the company’s cloud infrastructure.

    Throughout my career, I have demonstrated a proven ability to collaborate effectively 
    with cross-functional teams to drive operational excellence and deliver exceptional results. 
    My passion for technology and emerging trends in cloud infrastructure fuels my commitment to 
    optimizing performance and enhancing business growth.

    ### Key Skills and Expertise:

    - **Cloud Engineering:** Expertise in designing, deploying, and managing scalable 
    and secure cloud infrastructure using AWS and Azure.
    - **Automation:** Highly proficient in using tools like Terraform, Ansible, and 
    CloudFormation to automate cloud operations and deployments.
    - **DevOps Practices:** Strong advocate for DevOps methodologies, including CI/CD, 
    infrastructure as code (IaC), and continuous monitoring to 
    ensure smooth and efficient operations.
    - **Programming:** Skilled in Python, Bash, and other scripting languages 
    to develop custom automation solutions and streamline workflows.
    - **Collaboration:** Adept at working with cross-functional teams, including developers, 
    data scientists, and business stakeholders, to deliver high-impact projects.
    - **Problem-Solving:** Ability to analyze complex problems, identify root causes, 
    and develop effective solutions that drive business value.
    - **Innovation:** Passionate about exploring and implementing cutting-edge technologies 
    to stay ahead of industry trends and deliver state-of-the-art solutions.

    ### Career Highlights:

    - **Platform Engineer, Financial Services Firm:** Led the design and implementation of a 
    robust cloud infrastructure that supports the data team’s analytical and operational needs, 
    resulting in improved performance and scalability.
    - **Cloud Automation Engineer, Medical Device Company:** 
    Successfully automated cloud operations, reducing manual intervention and operational costs 
    while improving system reliability and uptime.

    My portfolio is a testament to my dedication to cloud engineering and development. 
    It highlights my journey, projects, and the continuous pursuit of excellence in optimizing cloud 
    infrastructure to drive business success. I invite you to explore my work and connect with me to 
    discuss potential collaborations or opportunities.

    ---
    """
    )

    if st.button("🔋 Amazon FSX for NetApp ONTAP"):
        st.switch_page("pages/Amazon_FSX_for_NetApp_ONTAP.py")

    if st.button("📚 Certifications"):
        st.switch_page("pages/Certifications.py")

    if st.button("📊 Site Architecture"):
        st.switch_page("pages/Site_Architecture.py")


if __name__ == "__main__":
    main()
