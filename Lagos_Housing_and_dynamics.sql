SELECT 
    rel.lga,
    Population_2024,
    _2024_Density_per_sq_km,
    CAST((Number_of_Registered_Businesses + Number_of_Registered_Businesses * 0.1302) as int)AS Number_of_Registered_Businesses_2024,
    cast(Unemployment_Rate_2024 as decimal(8,2)) Unemployment_Rate_2024,
    CAST( AVG(price) as int) AS avg_rent_2024,
    Bedrooms AS Apartment_Rooms,
    Population_2023,
    _2023_Density_per_sq_km,
    Number_of_Registered_Businesses AS Number_of_Registered_Businesses_2023,
    cast(Unemployment_Rate_2023 as decimal(8,2)) Unemployment_Rate_2023,
    Average_Rent as avg_rent_2023

FROM 
    real_estate_listing rel
Full JOIN 
    Lagos_Rent_2023 lr 
         ON LOWER(rel.lga) = LOWER(lr.LGA)
FULL JOIN Lagos_Unemployment_Rate lur
        ON LOWER(lur.LGA) = LOWER(rel.lga)
FULL JOIN population_data PD 
        ON lower(REL.lga) = lower(PD.Local_Government_Area)

    WHERE Bedrooms < 4 and price < 40000000
GROUP BY
    rel.lga,
    Number_of_Registered_Businesses,
    Bedrooms,
    Average_Rent,
    Unemployment_Rate_2023,
    Unemployment_Rate_2024,
    Population_2023,
    Population_2024,
    _2023_Density_per_sq_km,
    _2024_Density_per_sq_km
    
    ORDER BY 1;
