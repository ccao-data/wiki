# Valuing Multi-PIN and Multi-Card Aggregations

## Multi-Card PIN Valuation

Multi-card parcels are properties (PINs) that include more than one building,
each represented by its own "card". Because our model is trained at the building
level, these parcels can be challenging to value accurately. Each building has its
own set of features, including characteristics and location data.

![](/Residential/model_single_card_assumption.PNG)

Previously, we predicted the value of each card individually and summed the results. This approach essentially predicted on location data twice, once for each card. If we want to predict on the entire parcel, it is sensible to only include the location data once.

We consolidate the building square footage from all cards into a single “main” card.
We then predict once for that combined building, ensuring location data is only
factored in once while still capturing the total building area.

![](/Residential/model_multi_card_aggregation.PNG)
