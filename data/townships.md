# Townships

Cook County is divided into three parts, called 'triads' or 'tris'. Triads are reassessed on a triennial assessment cycle (i.e. they are assessed every three years). Triads are made up of smaller units known as townships. Townships act as a sort of 'unit of work' within the assessor's office, as they are assessed, mailed, appealed, and closed on a predetermined schedule. Townships are also important for modeling, as they're often used as fixed effects (in conjunction with neighborhoods) to absorb geographic variation in assessed value.

## Township Definitions

The table below represents township and triad definitions as of 2020. This data is also accessible via the [CCAO R package](https://gitlab.com/ccao-data-science---modeling/packages/ccao). You can retrieve this data with the following code:

```r
 # After intalling the package using the instruction in the package README 
 # Load the ccao library
library(ccao)

ccao::town_dict
```

|township_name|township_code|triad_code|triad_name|
|-------------|-------------|----------|----------|
|Barrington   |10           |2         |North     |
|Berwyn       |11           |3         |South     |
|Bloom        |12           |3         |South     |
|Bremen       |13           |3         |South     |
|Calumet      |14           |3         |South     |
|Cicero       |15           |3         |South     |
|Elk Grove    |16           |2         |North     |
|Evanston     |17           |2         |North     |
|Hanover      |18           |2         |North     |
|Lemont       |19           |3         |South     |
|Leyden       |20           |2         |North     |
|Lyons        |21           |3         |South     |
|Maine        |22           |2         |North     |
|New Trier    |23           |2         |North     |
|Niles        |24           |2         |North     |
|Northfield   |25           |2         |North     |
|Norwood Park |26           |2         |North     |
|Oak Park     |27           |3         |South     |
|Orland       |28           |3         |South     |
|Palatine     |29           |2         |North     |
|Palos        |30           |3         |South     |
|Proviso      |31           |3         |South     |
|Rich         |32           |3         |South     |
|River Forest |33           |3         |South     |
|Riverside    |34           |3         |South     |
|Schaumburg   |35           |2         |North     |
|Stickney     |36           |3         |South     |
|Thornton     |37           |3         |South     |
|Wheeling     |38           |2         |North     |
|Worth        |39           |3         |South     |
|Hyde Park    |70           |1         |City      |
|Jefferson    |71           |1         |City      |
|Lake         |72           |1         |City      |
|Lake View    |73           |1         |City      |
|North Chicago|74           |1         |City      |
|Rogers Park  |75           |1         |City      |
|South Chicago|76           |1         |City      |
|West Chicago |77           |1         |City      |
