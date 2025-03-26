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

## Prorated PINs

### Proration

Some buildings span multiple parcel boundaries. When this happens, each parcel (PIN) technically includes only part of the same building. Valuing those parcels must then “prorate” the building value so that each PIN gets its fair share.

1. **Calculate Building-Only Value:**  
   - To figure out the building’s contribution to total value, we subtract out the land value from our model’s predicted total for each PIN. For parcels in a prorated building, we average these “building-only” values across all of its PINs. This average becomes the building-wide figure we’ll distribute among the PINs.

2. **Prorate the Building:**  
   - Multiply the building-wide figure by each PIN’s proration rate (e.g., if a PIN has 30% of the building, it gets 30% of that amount).  

3. **Add Back Land:**  
   - Each PIN has its own land value, which is not shared.  
   - Final PIN value = prorated building value + that PIN’s land value.

This is a toy example illustrating the process:

![](/Residential/model_prorated_building.PNG)
