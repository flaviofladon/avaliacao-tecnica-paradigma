-- =========================================
-- Exercício: Maior salário por departamento
-- =========================================

-- Criação das tabelas
CREATE TABLE Departamento (
  Id INTEGER,
  Nome TEXT
);

CREATE TABLE Pessoa (
  Id INTEGER,
  Nome TEXT,
  Salario INTEGER,
  DeptId INTEGER
);

-- Inserção de dados
INSERT INTO Departamento VALUES
(1, 'TI'),
(2, 'Vendas');

INSERT INTO Pessoa VALUES
(1, 'Joe', 70000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1);

-- Consulta: colaborador com maior salário por departamento
SELECT
    d.Nome AS Departamento,
    p.Nome AS Pessoa,
    p.Salario
FROM Pessoa p
JOIN Departamento d ON d.Id = p.DeptId
JOIN (
    SELECT
        DeptId,
        MAX(Salario) AS MaxSalario
    FROM Pessoa
    GROUP BY DeptId
) m ON m.DeptId = p.DeptId
   AND m.MaxSalario = p.Salario;
