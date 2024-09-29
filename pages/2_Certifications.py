"""
    This page shows images of the certifications I have acheived.
"""

import streamlit as st

st.markdown("# Certifications")
st.markdown(
    """Certifications combined with hands on experience allow me to learn, practice,
            and test my knowledge. My certifications reflect my focus on agile development
            and cloud infrastructure.
"""
)
st.markdown("## Amazon Web Services")

col1, col2 = st.columns(2)

with col1:
    st.image("images/AwsSSA.png")
with col2:
    st.image("images/AwsCCP.png")

st.divider()
st.markdown("## Agile Development")

col3, col4, col5 = st.columns(3)

with col3:
    st.image("images/ScrumMaster.png")
with col4:
    st.image("images/ProductOwner.png")
with col5:
    st.image("images/Kanban.png")
