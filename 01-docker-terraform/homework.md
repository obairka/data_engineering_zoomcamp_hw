# Module 1 Homework: Docker & SQL

## Question 1. Understanding docker first run 
*Answer*: 24.3.1

## Question 2. Understanding Docker networking and docker-compose
*Answer*: db:5432

## Question 3.

```sql
SELECT 
	SUM(CASE WHEN trip_distance <= 1 THEN 1 ELSE 0 END) AS "Up to 1 mile",
	SUM(CASE WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1 ELSE 0 END) AS "(1, 3]",
	SUM(CASE WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1 ELSE 0 END) AS "(3, 7]",
	SUM(CASE WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1 ELSE 0 END) AS "(7, 10]",
	SUM(CASE WHEN trip_distance > 10 THEN 1 ELSE 0 END) AS "Over 10"
FROM green_taxi_trips 
WHERE 
	lpep_pickup_datetime >= '2019-10-01' 
	AND lpep_pickup_datetime < '2019-11-01'
	AND lpep_dropoff_datetime >= '2019-10-01' 
	AND lpep_dropoff_datetime < '2019-11-01'
```

*Answer*: 104,802; 198,924; 109,603; 27,678; 35,189

## Question 4

```sql
SELECT 
    lpep_pickup_datetime AS pickup_date,
    trip_distance
FROM green_taxi_trips
ORDER BY trip_distance DESC
LIMIT 1;
```

or

```sql
SELECT 
    lpep_pickup_datetime AS pickup_date,
    trip_distance
FROM green_taxi_trips
WHERE trip_distance = (SELECT MAX(trip_distance) FROM green_taxi_trips)
ORDER BY lpep_pickup_datetime ASC
LIMIT 1;
```

*Answer*: 2019-10-31

## Question 5



```sql
SELECT
    z."Zone",
    SUM(t.total_amount) AS total_revenue
FROM green_taxi_trips AS t
JOIN zones AS z ON t."PULocationID" = z."LocationID"
WHERE t.lpep_pickup_datetime >= '2019-10-18'
  AND t.lpep_pickup_datetime < '2019-10-19'
GROUP BY z."Zone"
HAVING SUM(t.total_amount) > 13000 
ORDER BY total_revenue DESC
LIMIT 4;
```

*Answer*: East Harlem North, East Harlem South, Morningside Heights

## Question 6.


```sql
SELECT 
    dz."Zone" AS "Drop Off",
    t.tip_amount AS tip
FROM green_taxi_trips AS t
JOIN zones AS pz ON t."PULocationID" = pz."LocationID"
JOIN zones AS dz ON t."DOLocationID" = dz."LocationID"
WHERE t.lpep_pickup_datetime >= '2019-10-01'
  AND t.lpep_pickup_datetime < '2019-11-01'
  AND pz."Zone" = 'East Harlem North'
ORDER BY t.tip_amount DESC
LIMIT 1;
```

*Answer*: JFK Airport

## Question 7
 
*Answer*: terraform init, terraform apply -auto-approve, terraform destroy
 
