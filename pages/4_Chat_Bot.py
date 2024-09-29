"""
This page provides a ChatGPT like playground using a custom provided API key.
"""

import streamlit as st
from openai import OpenAI

st.title("ChatGPT-like clone")

# API Key Input
api_key = st.text_input("Enter your OpenAI API Key:", type="password")

# Initialize OpenAI client only if the API key is provided
if api_key:
    client = OpenAI(api_key=api_key)
else:
    st.warning("Please enter your API key to use the chatbot.")
# Add Reset Chat button
with st.sidebar:
    if st.button("Reset Chat"):
        st.session_state.messages = []  # Clear chat history
        st.success("Chat has been reset.")
# Check if the model is set in session state
if "openai_model" not in st.session_state:
    st.session_state["openai_model"] = "gpt-3.5-turbo"

# Initialize messages in session state
if "messages" not in st.session_state:
    st.session_state.messages = []

# Display messages in the chat
for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])

# Handle user input
if prompt := st.chat_input("What is up?"):
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    if api_key:  # Ensure API key is provided before making the call
        with st.chat_message("assistant"):
            stream = client.chat.completions.create(
                model=st.session_state["openai_model"],
                messages=[
                    {"role": m["role"], "content": m["content"]}
                    for m in st.session_state.messages
                ],
                stream=True,
            )
            response = st.write_stream(stream)
        st.session_state.messages.append({"role": "assistant", "content": response})
    else:
        st.warning("Please enter your API key before sending a message.")
