    CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE colaboradores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    chave_acesso TEXT NOT NULL UNIQUE,
    ativo INTEGER NOT NULL DEFAULT 1,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reclamacoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER,
    colaborador_id INTEGER,
    tipo_registro TEXT NOT NULL,
    texto_original TEXT NOT NULL,
    texto_tratado TEXT,
    status TEXT NOT NULL DEFAULT 'PENDENTE',
    aceite_cliente INTEGER,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (colaborador_id) REFERENCES colaboradores(id)
);


CREATE TABLE tokens_acesso (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reclamacao_id INTEGER NOT NULL,
    token TEXT NOT NULL UNIQUE,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    expiracao DATETIME,
    ativo INTEGER NOT NULL DEFAULT 1,

    FOREIGN KEY (reclamacao_id) REFERENCES reclamacoes(id)
);