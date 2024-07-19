import streamlit as st
import requests
import json

params = {"q": "fsx-ontap", "limit": 1, "provder": "aws", "namespace": "trimnormal"}
r = requests.get("https://registry.terraform.io/v1/modules/search", params=params)
download_count = r.json()["modules"][0]["downloads"]
version = r.json()["modules"][0]["tag"]
description = r.json()["modules"][0]["description"]

metric_params = {"namespace": "trimnormal", "name": "fsx-ontap", "provider": "aws"}
namespace = "trimnormal"
name = "fsx-ontap"
provider = "aws"

metric_r = requests.get(
    f"https://registry.terraform.io/v2/modules/{namespace}/{name}/{provider}/downloads/summary"
)
download_data = metric_r.json()["data"]["attributes"]
week = download_data["week"]
month = download_data["month"]
year = download_data["year"]
total = download_data["total"]

st.set_page_config(page_title="Amazon FSX for NetApp ONTAP", page_icon="📈")

st.markdown("# Terraform Module: Amazon FSX for NetApp ONTAP")
col1, col2, col3 = st.columns(3)
col4, col5, col6 = st.columns(3)
with col1:
    st.metric(":violet[Total Downloads]", download_count)
with col2:
    st.metric(":violet[Version]", version)
with col3:
    st.link_button(
        ":violet[Terraform Registry]",
        "https://registry.terraform.io/modules/trimnormal/fsx-ontap/aws/latest",
    )
with col4:
    st.metric(":violet[Downloads this Week]", week)
with col5:
    st.metric(":violet[Downloads this Month]", month)
with col6:
    st.metric(":violet[Downloads this Year]", year)

st.markdown(f"Description: {description}")
st.markdown(
    """
---

**What is AWS FSx for NetApp ONTAP?**

AWS FSx for NetApp ONTAP is a fully managed service that provides advanced data management capabilities, combining the power of NetApp’s ONTAP file system with the scalability, agility, and security of AWS. This service allows you to launch, run, and scale fully managed NetApp ONTAP file systems in the cloud with ease, providing seamless integration with your existing data and applications.

Key features include:

- **High Performance:** Delivers high throughput and low latency for both file and block storage workloads.
- **Data Management:** Offers NetApp ONTAP's rich data management features, such as data deduplication, compression, tiering, cloning, and snapshots.
- **Scalability:** Scales up to petabytes of data, supporting high-performance and I/O-intensive workloads.
- **Security and Compliance:** Provides robust security with encryption at rest and in transit, and integrates with AWS Identity and Access Management (IAM) for fine-grained access control.
- **Cost Efficiency:** Helps optimize costs with storage efficiency features and the ability to choose between SSD and HDD storage options.

AWS FSx for NetApp ONTAP is ideal for applications that require shared file storage with enterprise-grade features, such as file services, databases, big data analytics, and development and test environments.

---

**Why did I develop this module?**

When I began working on this module in August of 2023
"""
)
