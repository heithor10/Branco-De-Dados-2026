
-- ============================================
-- 1. CRIAR JOGADOR
-- ============================================

CREATE TABLE jogador (
    id_jogador SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================
-- 2. CRIAR PERFIL (1:1)
-- CHAVE ESTRANGEIRA NO CREATE TABLE
-- ============================================

CREATE TABLE perfil (
    id_perfil SERIAL PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL,
    ranking INT,
    descricao TEXT,
    id_jogador INT NOT NULL UNIQUE
        REFERENCES jogador(id_jogador)
);


-- ============================================
-- 3. CRIAR EQUIPE
-- ============================================

CREATE TABLE equipe (
    id_equipe SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(10),
    data_criacao DATE
);


-- ============================================
-- 4. RELACIONAR JOGADOR COM EQUIPE (1:N)
-- UTILIZANDO ALTER TABLE
-- ============================================

ALTER TABLE jogador ADD COLUMN id_equipe INT;
ALTER TABLE jogador ADD CONSTRAINT fk_jogador_equipe FOREIGN KEY (id_equipe) REFERENCES equipe(id_equipe);