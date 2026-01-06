-- ==================================================
-- Maior salário por departamento usando ROW_NUMBER
-- ==================================================

SELECT
    Departamento,
    Pessoa,
    Salario
FROM (
    SELECT
        d.Nome AS Departamento,
        p.Nome AS Pessoa,
        p.Salario,
        ROW_NUMBER() OVER (
            PARTITION BY p.DeptId
            ORDER BY p.Salario DESC
        ) AS rn
    FROM Pessoa p
    JOIN Departamento d
        ON d.Id = p.DeptId
) t
WHERE rn = 1;
