
DROP SCHEMA public cascade;
CREATE SCHEMA public;

-- tables
-- Table: Arquivos
CREATE TABLE Arquivos (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome_arquivos varchar(300) ,
    extensao varchar(300),
    Colaborador_ID int not null,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Acessos
CREATE TABLE Acessos (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Cargos_ID int ,
    nivel_acesso int ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Cargos
CREATE TABLE Cargos (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Departamento_ID int ,
    cargo varchar(300) ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Colaboradors
CREATE TABLE Colaboradors (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Cargos_ID int ,
    gestor_ID int ,
    nome varchar(300) ,
    email varchar(300) ,
    senha varchar(300) ,
    naturalidade varchar(200),
    nacionalidade varchar(200),
    estado_civil varchar(200),
    genero varchar(200),
    raca varchar(100),
    telefone varchar(300) ,
    data_nascimento varchar(300) ,
    pesquisa_desligamento varchar(300),
    status varchar(200) ,
    dominio varchar(300) ,
    tipo_desligamento varchar(300),
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Contratos
CREATE TABLE Contratos (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Colaborador_ID int ,
    faixa_salarial int ,
    auxilio_creche int ,
    vale_refeicao int ,
    distrato varchar(45) ,
    contrato_trabalho varchar(200) ,
    codigo_conduta_etica varchar(40) ,
    vale_transporte int ,
    base varchar(300) ,
    data_Admissao date ,
    plano_saude varchar(40) ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" int ,
    data_desligamento date 
);

-- Table: Dados_Academicos
CREATE TABLE Dados_Academicos (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Colaborador_ID int ,
    formacao varchar(200) ,
    cursos varchar(200) ,
    termo_PI varchar(200) ,
    linguas varchar(200) ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Departamentos
CREATE TABLE Departamentos (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    area varchar(300) ,
    head varchar(300) ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Enderecos
CREATE TABLE Enderecos (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    rua varchar(300),
    estado varchar(200) ,
    regiao varchar(300) ,
    cep varchar(300) ,
    cidade varchar(300) ,
    bairro varchar(300) ,
    complemento varchar(300) ,
    Colaborador_ID int ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
    );

-- Table: Grade_Cursos
CREATE TABLE Grade_Cursos (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Trilha_Aprendizados_ID int ,
    nome_curso varchar(200) ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Pessoa_Fisicas
CREATE TABLE Pessoa_Fisicas (
    Colaborador_ID int NOT NULL PRIMARY KEY,
    cpf varchar(15),
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Pessoa_Juridicas
CREATE TABLE Pessoa_Juridicas (
    Colaborador_ID int NOT NULL PRIMARY KEY,
    cnpj varchar(20) ,
    empresa_contratada varchar(300) ,
    tempo_formalizacao varchar(300) ,
    natureza_juridica varchar(300) ,
    data_fundacao varchar(300) ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- Table: Trilha_Aprendizados
CREATE TABLE Trilha_Aprendizados (
    ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Pessoa_Fisicas_Colaborador_ID int ,
    status_curso varchar(200) ,
    data_inicio date ,
    data_fim date ,
    "createdAt" date NOT NULL DEFAULT now(),
    "updatedAt" date 
);

-- foreign keys

-- Reference: Arquivos_Colaborador (table: Colaboradors)
ALTER TABLE Arquivos ADD CONSTRAINT Arquivo_Colaborador FOREIGN KEY (Colaborador_ID)
    REFERENCES Colaboradors (ID);
-- Reference: Acesso_Cargo (table: Acessos)
ALTER TABLE Acessos ADD CONSTRAINT Acesso_Cargo FOREIGN KEY (Cargos_ID)
    REFERENCES Cargos (ID);

-- Reference: Cargo_Colaborador (table: Cargos)
ALTER TABLE Colaboradors ADD CONSTRAINT Colaboradors_Cargo FOREIGN KEY (Cargos_ID)
    REFERENCES Cargos (ID);
    
-- Reference: Colaborador_Colaborador (table: Colaboradors)
ALTER TABLE Colaboradors ADD CONSTRAINT Colaboradors_Colaborador FOREIGN KEY (gestor_ID)
    REFERENCES Colaboradors (ID);
    
ALTER TABLE Cargos ADD CONSTRAINT Departamento_Cargo FOREIGN KEY  (Departamento_ID)
    REFERENCES Departamentos (ID);

-- Reference: Contrato_Colaborador (table: Contratos)
ALTER TABLE Contratos ADD CONSTRAINT Contrato_Colaborador FOREIGN KEY (Colaborador_ID)
    REFERENCES Colaboradors (ID);

-- Reference: Dados_Academicos_Colaborador (table: Dados_Academicos)
ALTER TABLE Dados_Academicos ADD CONSTRAINT Dados_Academicos_Colaborador FOREIGN KEY (Colaborador_ID)
    REFERENCES Colaboradors (ID);

-- Reference: Endereco_Colaborador (table: Colaboradors)
ALTER TABLE Enderecos ADD CONSTRAINT Endereco_Colaborador FOREIGN KEY (Colaborador_ID)
    REFERENCES Colaboradors (ID);

-- Reference: Grade_Curso_Trilha_Aprendizado (table: Grade_Cursos)
ALTER TABLE Grade_Cursos ADD CONSTRAINT Grade_Curso_Trilha_Aprendizado FOREIGN KEY (Trilha_Aprendizados_ID)
    REFERENCES Trilha_Aprendizados (ID);

-- Reference: Pessoa_Fisica_Colaborador (table: Pessoa_Fisicas)
ALTER TABLE Pessoa_Fisicas ADD CONSTRAINT Pessoa_Fisica_Colaborador FOREIGN KEY (Colaborador_ID)
    REFERENCES Colaboradors (ID);

-- Reference: Pessoa_Juridica_Colaborador (table: Pessoa_Juridicas)
ALTER TABLE Pessoa_Juridicas ADD CONSTRAINT Pessoa_Juridica_Colaborador FOREIGN KEY (Colaborador_ID)
    REFERENCES Colaboradors (ID);

-- Reference: Trilha_Aprendizado_Pessoa_Fisica (table: Trilha_Aprendizados)
ALTER TABLE Trilha_Aprendizados ADD CONSTRAINT Trilha_Aprendizado_Pessoa_Fisica FOREIGN KEY (ID)
    REFERENCES Pessoa_Fisicas (Colaborador_ID);


	
	

insert into Departamentos(ID, area, "createdAt") values (1, 'Administracao', '2022-04-13');
insert into Cargos(ID, Departamento_ID, cargo, "createdAt") values (1, 1, 'Administrador', '2022-04-13');
insert into Colaboradors(ID, Cargos_ID, nome, email, senha, "createdAt") values (1, 1, 'Admin', 'admin@ionic.com', 'adminionic', '2022-04-13');