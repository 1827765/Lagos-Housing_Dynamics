select lur.LGA,
    _2023_Population,
    _2023_Density_per_sq_km,
    Number_of_Registered_Businesses as no_of_business_2023,
    avg(Unemployment_Rate_2023) as unemployment_2023,
    _2024_Population,
    _2024_Density_per_sq_km,
    no_of_business_2024,
    avg(Unemployment_Rate_2024) Unemployment_2024,
    average_rent,
    Bedrooms,
    Toilets

from lagos_housing_data lhd 
left join Lagos_Unemployment_Rate lur
on LOWER(lhd.LGA) = LOWER(lur.LGA)

    WHERE lur.LGA is not null

GROUP BY lur.LGA,
    _2023_Population,
    _2023_Density_per_sq_km,
    Number_of_Registered_Businesses,
    _2024_Population,
    _2024_Density_per_sq_km,
    no_of_business_2024,
        average_rent,
    Bedrooms,
    Toilets



    order by average_rent DESC
