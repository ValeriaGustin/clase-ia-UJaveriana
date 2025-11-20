# Clasificador de Contenido Político - Sistema de Análisis de Tweets

## Tabla de Contenidos
- [Descripción](#-descripción)
- [Características](#-características)
- [Arquitectura](#️-arquitectura)
- [Stack Tecnológico](#-stack-tecnológico)
- [Requisitos](#-requisitos)
- [Instalación Rápida](#-instalación-rápida)
- [Configuración](#️-configuración)
- [Uso](#-uso)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [API](#-api)
- [Dashboard](#-dashboard)
- [Solución de Problemas](#-solución-de-problemas)
- [Contribución](#-contribución)
- [Licencia](#-licencia)
- [Soporte](#-soporte)
- [Actualizaciones](#-actualizaciones)
- [Próximos Pasos](#-próximos-pasos)

---

## Descripción
Sistema inteligente de clasificación automática de tweets políticos que analiza y clasifica contenido en múltiples dimensiones usando IA avanzada. Perfecto para análisis de sentimiento, detección de desinformación y moderación de contenido.

---

## Características

### Funcionalidades Core
-  Clasificación Multi-dimensional: Sentimiento, postura política, riesgo de desinformación  
-  Detección de Contenido Nocivo: Discurso de odio, spam, polarización  
-  Dashboard en Tiempo Real: Métricas y visualizaciones interactivas  
-  Sistema de Alertas: Notificaciones automáticas por email  
-  Pipeline Automatizado: Flujo completo de ingestión a clasificación  

### Dimensiones de Análisis
- **Sentimiento:** Positivo, Negativo, Neutro  
- **Postura Política:** A favor, En contra, Neutral, No relacionado  
- **Riesgo de Desinformación:** Alto, Medio, Bajo, Ninguno  
- **Nivel de Polarización:** Alto, Medio, Bajo  
- **Detección de Spam:** Clasificación automática
- **Contenido Nocivo:** 7 categorías de discurso de odio

---

## Arquitectura


---

## Stack Tecnológico
- **Orquestación:** Docker Compose  
- **Workflow Automation:** n8n  
- **AI/ML:** GPT-4o-mini (GitHub Models)  
- **Base de Datos:** PostgreSQL 15  
- **Dashboard:** Streamlit + Plotly  
- **APIs:** RESTful endpoints  

---

## Requisitos

### Prerrequisitos del Sistema
- Docker 20.10+  
- Docker Compose 2.0+  
- 4GB RAM mínimo  
- 10GB de espacio en disco  

### Credenciales Requeridas
- API Key de TwitterAPI.io  
- Token de GitHub Models  
- Credenciales Gmail (para alertas)  

---

## Instalación Rápida

### 1. Clonar el Repositorio
```bash
git clone https://github.com/tu-usuario/comment_classifier.git
cd comment_classifier
