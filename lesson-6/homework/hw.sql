Puzzle 1: Distinct pairs (treat (a,b) = (b,a))

You want to collapse (a, b) and (b, a) into a single canonical pair. Two methods:

Method A: Canonical ordering + DISTINCT

SELECT DISTINCT
  CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
  CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;


You reorder each row so the “smaller” of the two strings is first.

Then DISTINCT eliminates duplicate ordered pairs.

Yields: (a, b), (c, d), (m, n).

Method B: Group by the canonical pair (or use aggregation)

SELECT
  CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
  CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl
GROUP BY
  CASE WHEN col1 < col2 THEN col1 ELSE col2 END,
  CASE WHEN col1 < col2 THEN col2 ELSE col1 END;


Equivalent to Method A but uses GROUP BY rather than DISTINCT.

Alternatively, you could wrap the canonical expression in a subquery and then do SELECT DISTINCT or GROUP BY outside.

Note: In MySQL you might also try COUNT(DISTINCT col1, col2) or using CONCAT(col1, col2) trick (but be cautious about collisions). 
Baeldung on Kotlin
+1

Also see discussion of duplicates in different orders on StackOverflow: 
Stack Overflow

Puzzle 2: Remove rows where all columns = 0
SELECT A, B, C, D
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);


Or equivalently:

SELECT A, B, C, D
FROM TestMultipleZero
WHERE A <> 0 OR B <> 0 OR C <> 0 OR D <> 0;


This ensures you filter out exactly the row where all four columns are zero.

Puzzle 3: Find rows with odd ids
SELECT id, name
FROM section1
WHERE id % 2 = 1;


Or in some dialects:

WHERE MOD(id, 2) = 1


This returns id = 1, 3, 5, 7.

Puzzle 4: Person with the smallest id
-- SQL Server / T‑SQL
SELECT TOP 1 id, name
FROM section1
ORDER BY id ASC;

-- Standard / MySQL / PostgreSQL
SELECT id, name
FROM section1
ORDER BY id
LIMIT 1;


Gives the row with id = 1, name = “Been”.

Puzzle 5: Person with the highest id
-- SQL Server
SELECT TOP 1 id, name
FROM section1
ORDER BY id DESC;

-- Others
SELECT id, name
FROM section1
ORDER BY id DESC
LIMIT 1;


Gives the row with id = 8, name = “Andro”.

Puzzle 6: People whose name starts with “b”
SELECT id, name
FROM section1
WHERE name LIKE 'b%'  -- case‐sensitive version

-- Or case‐insensitive:
WHERE LOWER(name) LIKE 'b%';


This returns names “Been” and “Bruno” (ids 1 and 6).

Puzzle 7: Rows where Code contains literal underscore “_”

You must treat _ as a literal, not a wildcard. Use an escape or bracket syntax:

SELECT Code
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';


Or in SQL Server, you can use:

WHERE Code LIKE '%[_]%';


This returns codes like X_456, X_ABC.

📋 Combined summary (for submission)
-- Puzzle 1: distinct unordered pairs
SELECT DISTINCT
  CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
  CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

-- Puzzle 2: remove all‑zero row
SELECT A, B, C, D
FROM TestMultipleZero
WHERE A <> 0 OR B <> 0 OR C <> 0 OR D <> 0;

-- Puzzle 3: odd ids
SELECT id, name FROM section1 WHERE id % 2 = 1;

-- Puzzle 4: smallest id
SELECT id, name
FROM section1
ORDER BY id
LIMIT 1;

-- Puzzle 5: highest id
SELECT id, name
FROM section1
ORDER BY id DESC
LIMIT 1;

-- Puzzle 6: name starts with “b”
SELECT id, name
FROM section1
WHERE LOWER(name) LIKE 'b%';

-- Puzzle 7: literal underscore
SELECT Code
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';
