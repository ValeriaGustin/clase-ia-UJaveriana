-- Crear base de datos n8n si no existe
SELECT 'CREATE DATABASE n8n' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'n8n')\gexec

-- Crear base de datos political_tweets si no existe
SELECT 'CREATE DATABASE political_tweets' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'political_tweets')\gexec

-- Otorgar permisos a ambas bases de datos
GRANT ALL PRIVILEGES ON DATABASE n8n TO n8nuser;
GRANT ALL PRIVILEGES ON DATABASE political_tweets TO n8nuser;

-- Verificar creación
SELECT 'Base de datos n8n creada/existe' as status;
SELECT 'Base de datos political_tweets creada/existe' as status;

-- Conectarse a la base de datos political_tweets
\c political_tweets;

CREATE TABLE tweets_analysis (
    id SERIAL PRIMARY KEY,
    tweet_id VARCHAR(50),          -- opcional: ID original del tweet
    tweet_text TEXT,               -- opcional: texto del tweet

    -- sentiment
    sentiment_classification VARCHAR(20) CHECK (sentiment_classification IN ('positivo', 'negativo', 'neutro')),
    sentiment_confidence NUMERIC(4,3),

    -- stance
    stance VARCHAR(20) CHECK (stance IN ('a_favor', 'en_contra', 'neutral', 'no_relacionado')),

    -- misinformation
    misinformation_risk VARCHAR(10) CHECK (misinformation_risk IN ('alto', 'medio', 'bajo', 'ninguno')),

    -- polarization
    polarization_level VARCHAR(10) CHECK (polarization_level IN ('alto', 'medio', 'bajo')),

    -- relevance
    relevance VARCHAR(10) CHECK (relevance IN ('alta', 'media', 'baja', 'ninguna')),

    -- spam detection
    is_spam BOOLEAN,
    spam_confidence NUMERIC(4,3),

    -- harmful content
    hate_speech_type VARCHAR(30) CHECK (
        hate_speech_type IN (
            'ninguno',
            'odio',
            'discriminación',
            'ataque_personal',
            'acoso',
            'violencia_politica',
            'incitación_violencia'
        )
    ),
    harmful_severity VARCHAR(10) CHECK (harmful_severity IN ('bajo','medio','alto','critico')),

    created_at TIMESTAMP DEFAULT NOW()
);