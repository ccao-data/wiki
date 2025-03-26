# Valuing Multi-PIN and Multi-Card Aggregations

## Multi-Card PIN Valuation

Multi-card parcels are properties (PINs) containing more than one building, each represented individually
as a separate "card." Since our model is trained at the building level—using specific features, characteristics,
and location data for each structure—accurately valuing multi-card parcels can be challenging.

![](/Residential/multi_pin_multi_card/model_single_card_assumption.PNG)

Previously, we valued multi-card PINs by individually predicting the value of each card and summing these
predictions. However, this solution wasn't ideal, as location data was effectively considered multiple
times. To resolve this, we consolidate the total building square footage from all cards into a single "main"
card and perform a single prediction. This approach ensures location data is accounted for just once while
accurately reflecting the total building area.

![](/Residential/multi_pin_multi_card/model_multi_card_aggregation.PNG)

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

![](/Residential/multi_pin_multi_card/proration_explainer.PNG)
