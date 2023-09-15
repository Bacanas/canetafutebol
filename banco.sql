-- Tabela para armazenar grupos
CREATE TABLE Grupo (
    grupo_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

-- Tabela para armazenar jogadores
CREATE TABLE Jogador (
    jogador_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

-- Tabela para associar jogadores aos grupos
CREATE TABLE Grupo_Jogador (
    grupo_jogador_id INT PRIMARY KEY AUTO_INCREMENT,
    grupo_id INT,
    jogador_id INT,
    FOREIGN KEY (grupo_id) REFERENCES Grupo(grupo_id),
    FOREIGN KEY (jogador_id) REFERENCES Jogador(jogador_id)
);

-- Tabela para armazenar partidas
CREATE TABLE Partida (
    partida_id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    grupo_id INT,
    FOREIGN KEY (grupo_id) REFERENCES Grupo(grupo_id)
);

-- Tabela para associar jogadores aos times em uma partida
CREATE TABLE Time (
    time_id INT PRIMARY KEY AUTO_INCREMENT,
    partida_id INT,
    FOREIGN KEY (partida_id) REFERENCES Partida(partida_id)
);

-- Tabela para associar jogadores aos times
CREATE TABLE Time_Jogador (
    time_jogador_id INT PRIMARY KEY AUTO_INCREMENT,
    time_id INT,
    jogador_id INT,
    FOREIGN KEY (time_id) REFERENCES Time(time_id),
    FOREIGN KEY (jogador_id) REFERENCES Jogador(jogador_id)
);

-- Tabela para armazenar eventos em partidas
CREATE TABLE Evento (
    evento_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    jogador_id INT,
    partida_id INT,
    FOREIGN KEY (jogador_id) REFERENCES Jogador(jogador_id),
    FOREIGN KEY (partida_id) REFERENCES Partida(partida_id)
);

-- Tabela para armazenar gols
CREATE TABLE Gol (
    gol_id INT PRIMARY KEY AUTO_INCREMENT,
    jogador_id INT,
    partida_id INT,
    FOREIGN KEY (jogador_id) REFERENCES Jogador(jogador_id),
    FOREIGN KEY (partida_id) REFERENCES Partida(partida_id)
);

-- Tabela para armazenar cartões
CREATE TABLE Cartao (
    cartao_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    jogador_id INT,
    partida_id INT,
    FOREIGN KEY (jogador_id) REFERENCES Jogador(jogador_id),
    FOREIGN KEY (partida_id) REFERENCES Partida(partida_id)
);
