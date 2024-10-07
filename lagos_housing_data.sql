-- Finding the average rent per LGA and other statistics
SELECT 
    LGA,
    Number_of_Registered_Businesses,
    (Number_of_Registered_Businesses) + (Number_of_Registered_Businesses *  0.25) as no_of_business_2024,
    _2023_Population,
    _2023_Density_per_sq_km,
    _2024_Population,
    _2024_Density_per_sq_km,
    AVG(price) AS average_rent,
     Bedrooms,
     Toilets
   
FROM
(
      -- Performing data join to clean data set and produce distinct query for analysis
    SELECT distinct
        owner_code,
        lower(REL.lga) as LGA,
        price,
        Toilets,
        Bedrooms,
        Number_of_Registered_Businesses,
        _2023_Population,
        _2023_Density_per_sq_km,
        _2024_Population,
        _2024_Density_per_sq_km,
        _2025_Population,
        _2025_Density_per_sq_km
    FROM real_estate_listing REL 
     full JOIN revenue REV
        ON lower(REL.lga) = lower(REV.LGA)
     full JOIN population_data PD 
        ON lower(REL.lga) = lower(PD.Local_Government_Area)
     full JOIN buisness_stats BS 
        ON lower(REL.lga) = lower(BS.Local_Government_Area)

        where Toilets < 10 and Bedrooms < 10 and price BETWEEN 200000 and 20000000
) mains

where LGA is not NULL
and _2024_Population is not null -- filtering out null values to allow rich data
GROUP BY 
    LGA,
    Number_of_Registered_Businesses,
    _2023_Population,
    _2023_Density_per_sq_km,
    _2024_Population,
    _2024_Density_per_sq_km,
    Toilets,
    Bedrooms;

-- final table out put shows the average rent, business spread and demographic
-- we can now use this information to create more indepth analysis and visualizations
-- using an assuption that the number of businesses increase by 25 percent since 2020 which was the 