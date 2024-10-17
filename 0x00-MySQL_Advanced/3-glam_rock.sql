-- List all bands with Glam rock as their main style, ranked by their lifespan.
-- Assuming 'metal_bands' is the table with relevant columns (band_name, formed, split, style)
SELECT band_name,CASE
		WHEN split IS NULL THEN 2022 - formed
		ELSE split - formed
	END AS lifespan
FROM metal_bands WHERE style = 'Glam Rock' ORDER BY lifespan DESC;
