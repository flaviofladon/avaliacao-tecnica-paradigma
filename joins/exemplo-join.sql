-- ============================
-- Exemplo básico de JOIN
-- ============================

-- Retorna todas as pessoas com seus respectivos departamentos

SELECT
    p.Id,
    p.Nome AS Pessoa,
    p.Salario,
    d.Nome AS Departamento
FROM Pessoa p
INNER JOIN Departamento d
    ON d.Id = p.DeptId
ORDER BY d.Nome, p.Nome;
