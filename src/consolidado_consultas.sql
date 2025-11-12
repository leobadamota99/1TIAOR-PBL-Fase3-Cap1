-- Consulta Geral
SELECT *
FROM SENSORES

-- Contagem total de ativações da bomba
SELECT
  Bomba_Ligada,
  COUNT(*) AS Total
FROM sensores
GROUP BY Bomba_Ligada;

-- pH fora da faixa x bomba ligada
SELECT
  PH_FORA_FAIXA,
  Bomba_Ligada,
  COUNT(*) AS Total
FROM sensores
GROUP BY PH_FORA_FAIXA, Bomba Ligada
ORDER BY PH_FORA_FAIXA DESC, Bomba_Ligada DESC;

-- Distribuição do pH -- agrupando por faixa
SELECT
  CASE
    WHEN PH < 6 THEN 'Ácido'
    WHEN PH BETWEEN 6 AND 7 THEN 'Neutro'
    ELSE 'Básico'
  END AS FaixaPH,
  COUNT(*) AS Total,
  ROUND(AVG(Umidade), 2) AS UmidadeMedia
FROM sensores
GROUP BY
  CASE
    WHEN PH < 6 THEN 'Ácido'
    WHEN PH BETWEEN 6 AND 7 THEN 'Neutro'
    ELSE 'Básico'
  END
ORDER BY Total DESC;

-- Contar quantas linhas foram importadas
SELECT COUNT(*) AS TotalRegistros FROM sensores;

-- Estatísticas da Umidade
SELECT
  MAX(Umidade) AS UmidadeMax,
  MIN(Umidade) AS UmidadeMin,
  ROUND(AVG(Umidade), 2) AS UmidadeMedia
FROM sensores;

-- Media de umidade e pH por status do sensor N
SELECT
  N_STATUS,
  ROUND(AVG(Umidade), 2) AS UmidadeMedia,
  ROUND(AVG(PH), 2) AS PHMedio,
  COUNT(*) AS TotalRegistros
FROM sensores
GROUP BY N_STATUS
ORDER BY N_STATUS;
