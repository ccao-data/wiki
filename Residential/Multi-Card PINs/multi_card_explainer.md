# Valuing Multi-PIN and Multi-Card Aggregations

## Multi-Card PIN Valuation (2-3 Cards)

Multi-card parcels are properties (PINs) containing more than one building, each represented individually
as a separate "card." Our model is trained at the building level, using specific features, characteristics, and
location data for each individual structure. This makes it difficult to accurately value
parcels that contain multiple buildings, since the model is designed to assess one building
at a time. Multi-card PINs are also excluded from the training data, so the model doesn't
see examples of them during training.

![](model_single_card_assumption.PNG)

### Why We Exclude Multi-Card PINs from Training

Machine learning models work better when they are trained on data with
a consistent structure. Ensuring every single row in the training data is a single-card
PIN helps the model learn the relationship between features and values more effectively.
It doesn't have to account for variation between single-card and multi-card PINs. We've
confirmed this through testing, including multi-card PINs in the training data results
in a significant drop in performance for single-card PINs, which make up the overwhelming
majority of residential PINs in cook county.

## Previous Method: Sum of predictions

Previously, we valued multi-card PINs by individually predicting the value of each card and summing these
predictions. However, this solution wasn't ideal, as location data was effectively considered multiple
times.

## New method: Aggregated Building Area on a Single Card

To improve these values, we consolidate the total building square footage from all cards into a single "main"
card and perform a single prediction. This approach ensures location data is accounted for just once while
accurately reflecting the total building area. This method results in both a stronger theoretical foundation
and improved performance for multi-card PINs.

![](model_multi_card_aggregation.PNG)

### Breaking Ties in Building Square Footage

When selecting which card should act as the "main" for aggregation, we apply the following logic:

1. Choose the card with the **largest building square footage**.
2. If there's a **tie**, we select the card with the **lowest card number** (e.g., Card 1 before Card 2).

**Example:**  
_If two buildings are both 1,200 sqft and one is Card 1 and the other is Card 2, we designate Card 1 as the main._

---

## Valuing 4+ Card PINs

For PINs with 4 or more cards, we continue using the previous method of summing individual card-level
predictions. These cases are rare and often unusually complex, sometimes resulting from administrative
anomalies in the underlying data. For example, a recorded sale might include several cards when, in
reality, one of those buildings has been split off into a new PIN that isn’t captured in our data.
Because of these inconsistencies—and the lack of a reliable theoretical foundation for aggregation
in such cases—these PINs are usually flagged for additional manual review. We don't yet have the
confidence or clarity in the data structure to apply the same aggregation method used for 2–3 card PINs.
