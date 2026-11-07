-- question 1
SELECT club_name,
COUNT(player_id) AS player_count
FROM player_contracts
JOIN clubs
USING (club_id)
GROUP BY club_id, club_name -- to be safe add club_id (because two clubs could have the same name)
HAVING COUNT(player_contracts.player_id) > 10
ORDER BY player_count DESC;

-- question 2
SELECT player_name, club_name,
EXTRACT (YEAR FROM CURRENT_DATE) - contract_valid_until :: INT AS years_remaining
FROM clubs
JOIN player_contracts
USING (club_id)
JOIN players
USING (player_id)
WHERE ((EXTRACT (YEAR FROM CURRENT_DATE) - contract_valid_until) > 0)
ORDER BY years_remaining DESC;

-- question 3
-- overall average wage accross all players
SELECT AVG(wage)::INT
FROM player_contracts; -- result == 9614

SELECT AVG(wage)::INT AS avg_wage, nationality
FROM player_contracts
JOIN players
USING (player_id)
GROUP BY nationality
HAVING AVG(wage) > (
  SELECT AVG(wage)::INT
  FROM player_contracts
)
ORDER BY avg_wage ASC;

-- question 4
SELECT player_name, club_name, wage
FROM clubs
JOIN player_contracts
USING (club_id)
JOIN players
USING (player_id)
WHERE EXISTS (
  SELECT club_id
  FROM player_contracts
  WHERE club_id = club_id
  AND wage >= 50000
)
ORDER BY wage DESC;

-- question 5
SELECT club_name
FROM clubs
LEFT JOIN player_contracts
USING (club_id)
WHERE player_id IS NULL;

-- question 6
SELECT player_name, preferred_foot,
CASE preferred_foot
WHEN 'Left' THEN 'Left-footed'
WHEN 'Right' THEN 'Right-footed'
ELSE 'Unknown'
END AS foot_description
FROM players;
