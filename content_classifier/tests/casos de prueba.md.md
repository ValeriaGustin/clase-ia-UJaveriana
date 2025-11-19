

##  Casos de Prueba
A continuación se describen los casos de prueba iniciales que permiten validar el comportamiento del sistema ante diferentes tipos de comentarios.

---

##  Caso de Prueba 1: Comentario positivo de e-commerce

**Objetivo:** Verificar que el sistema clasifique correctamente un comentario positivo, identifique categorías relevantes y determine que no existe urgencia ni señales de spam.

**Entrada:** Un comentario donde la usuaria expresa satisfacción con el producto, menciona la rapidez del envío y destaca el empaque.

**Proceso:**
- Se limpia el texto y se detectan palabras asociadas a sentimiento positivo.
- El clasificador determina el tono general del comentario.
- Se extraen categorías relacionadas con calidad, envío y empaque.
- El módulo de urgencia verifica que no existan expresiones críticas.
- El módulo de spam descarta elementos sospechosos.

**Resultado esperado:**
- Sentimiento: **positivo**, con alta confianza.
- Urgencia: **baja**, sin necesidad de respuesta.
- Spam: **no detectado**.
- Categorías: calidad del producto, velocidad de envío, empaque.
- Acción requerida: ninguna.
- Prioridad: **1**.

---

##  Caso de Prueba 2: Comentario crítico de soporte

**Objetivo:** Validar que el sistema identifique un comentario urgente asociado a una falla del sistema, clasifique la urgencia como crítica y sugiera acciones correctivas.

**Entrada:** Un comentario donde una cliente reporta una caída del sistema por varias horas utilizando expresiones de urgencia y presión comercial.

**Proceso:**
- Se detecta sentimiento negativo fuerte.
- El análisis de urgencia identifica palabras como "URGENTE", "YA" y "sistema caído".
- El motor de reglas clasifica el caso como crítico.
- Se activa una acción de escalamiento y se asigna prioridad alta.

**Resultado esperado:**
- Sentimiento: **negativo**.
- Urgencia: **crítica**, requiere respuesta inmediata.
- Spam: **no detectado**.
- Categorías: sistema caído, cliente VIP, urgencia comercial.
- Acción requerida: escalamiento a personal senior.
- Alertas posibles: mensajería o notificación en canales de soporte.
- Prioridad: **10**.

---

##  Caso de Prueba 3: Detección de spam

**Objetivo:** Comprobar que el sistema detecte mensajes promocionales engañosos, identifique señales de spam y recomiende acciones correctas como bloqueo.

**Entrada:** Un mensaje con promesas de dinero fácil, uso de mayúsculas, signos de exclamación excesivos y un enlace sospechoso.

**Proceso:**
- Se identifican patrones típicos de spam (dinero fácil, promociones exageradas).
- Se detecta uso excesivo de mayúsculas y puntuación.
- Se analiza un enlace abreviado sospechoso.
- El clasificador evalúa múltiples indicadores de spam.

**Resultado esperado:**
- Clasificación: **spam**.
- Alta confianza en la detección.
- Indicadores: promesas de dinero, urgencia artificial, enlaces sospechosos, puntuación excesiva.
- Acción requerida: bloquear y eliminar.
- Prioridad: **0**.

---


