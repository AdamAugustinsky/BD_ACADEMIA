CREATE DATABASE BD_ACADEMIA

USE BD_ACADEMIA

CREATE TABLE Instrutor(
    Id INTEGER IDENTITY(1,1) PRIMARY KEY,
    RG VARCHAR(12) NOT NULL UNIQUE,
    Nome VARCHAR(50) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Telefone VARCHAR(17)
)

SELECT * FROM Instrutor


CREATE TABLE Matricula(
    Id INTEGER  NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Data_Matricula  DATE NOT NULL,
    Data_Vencimento DATE,
    Id_Instrutor INTEGER NOT NULL FOREIGN KEY REFERENCES Instrutor(Id)
)

SELECT * FROM Matricula


CREATE TABLE Aluno(
    Id INTEGER PRIMARY KEY FOREIGN KEY REFERENCES Matricula(Id),
    RG VARCHAR(12) NOT NULL UNIQUE,
    Nome VARCHAR(50) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Altura FLOAT,
    Peso INTEGER,
    Telefone VARCHAR(20),
)

SELECT * FROM Aluno


CREATE TABLE Atividade(
    Id INTEGER NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Id_Instrutor INTEGER NOT NULL FOREIGN KEY REFERENCES Instrutor(Id)
)

SELECT * FROM Atividade


CREATE TABLE Turma(
    Id INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Horario_Aula INTEGER NOT NULL,
    Id_Atividade INTEGER NOT NULL FOREIGN KEY REFERENCES Atividade(Id)
)

SELECT * FROM Turma


CREATE TABLE Aluno_Turma(
    Id INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Id_Turma INTEGER NOT NULL FOREIGN KEY REFERENCES Turma(Id),
    Id_Aluno INTEGER NOT NULL FOREIGN KEY REFERENCES Aluno(Id)
)

SELECT * FROM Aluno_Turma


CREATE TABLE Ausencia(
    Id INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Data_Ausencia DATE NOT NULL,
    Id_AlunoTurma INTEGER NOT NULL FOREIGN KEY REFERENCES Aluno_Turma(Id)
)

SELECT * FROM Ausencia


CREATE TABLE Pagamento(
    Id INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Data_Pagamento DATE NOT NULL,
    Forma_Pagamento VARCHAR(20),
    Valor_Pagamento MONEY NOT NULL,
    Id_Matricula INTEGER NOT NULL FOREIGN KEY REFERENCES Matricula(Id)
)

SELECT * FROM Pagamento


CREATE TABLE Aluno_Monitor(
    Id_Turma INTEGER NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Turma(Id),
    Id_Aluno INTEGER NOT NULL UNIQUE FOREIGN KEY REFERENCES Aluno(Id)
)

SELECT * FROM Aluno_Monitor