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
