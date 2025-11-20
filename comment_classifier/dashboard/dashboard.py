import streamlit as st
import pandas as pd
import sqlalchemy as sa
import plotly.express as px

st.set_page_config(page_title="Political Tweets Dashboard", layout="wide")

# --- DB CONNECTION ---
DB_HOST = st.secrets["DB_HOST"]
DB_PORT = st.secrets["DB_PORT"]
DB_USER = st.secrets["DB_USER"]
DB_PASS = st.secrets["DB_PASS"]
DB_NAME = st.secrets["DB_NAME"]

engine = sa.create_engine(
    f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)


@st.cache_data
def load_data():
    query = "SELECT * FROM tweets_analysis ORDER BY created_at DESC"
    return pd.read_sql(query, engine)

df = load_data()

st.title("📊 Dashboard de Análisis de Tweets Políticos")

# --- METRICS ---
col1, col2, col3 = st.columns(3)

col1.metric("Total Tweets Analizados", df.shape[0])
col2.metric("Tweets con Spam", df[df["is_spam"] == True].shape[0])
col3.metric("Riesgo Alto de Desinformación", df[df["misinformation_risk"] == "alto"].shape[0])

st.divider()

# --- SENTIMENT PIE CHART ---
st.subheader("Sentimiento General")
fig_sent = px.pie(df, names="sentiment_classification", title="Distribución del Sentimiento")
st.plotly_chart(fig_sent, use_container_width=True)

# --- STANCE BAR ---
st.subheader("Posición (Stance)")
fig_stance = px.histogram(df, x="stance", title="Distribución de Stance", color="stance")
st.plotly_chart(fig_stance, use_container_width=True)

# --- MISINFORMATION RISK ---
st.subheader("Riesgo de Desinformación")
fig_mis = px.histogram(df, x="misinformation_risk", title="Riesgo de Desinformación", color="misinformation_risk")
st.plotly_chart(fig_mis, use_container_width=True)

# --- HATE SPEECH ---
st.subheader("Tipos de Discurso de Odio")
fig_hate = px.histogram(df, x="hate_speech_type", title="Discurso de Odio", color="hate_speech_type")
st.plotly_chart(fig_hate, use_container_width=True)

# --- RAW DATA ---
st.subheader("Datos Raw")
st.dataframe(df)