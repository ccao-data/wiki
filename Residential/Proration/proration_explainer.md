# Proration

Some buildings span multiple parcel boundaries. When this happens, each parcel (PIN) technically includes only part of the same building. Valuing those parcels must then “prorate” the building value so that each PIN gets its fair share.

Initially, each PIN gets a value with our model, which is in part based on the total value of the entire building. However, for the prorated PIN case, we need to adjust this value to reflect the fact that each PIN only contains a portion of the building.

---

## 1. Calculate Building-Only Value

To figure out the building’s contribution to total value, we subtract out the land value from our model’s predicted total for each PIN. For parcels in a prorated building, we average these “building-only” values across all of its PINs. This average becomes the building-wide figure we’ll distribute among the PINs.

## 2. Prorate the Building

Multiply the average building value by each PIN’s proration rate (e.g., if a PIN has 30% of the building, it gets 30% of that amount).

## 3. Add Back Land

Each PIN has its own land value, which is not shared.  
Final PIN value = prorated building value + that PIN’s land value.

### How Land Value is Determined

Land value rates are determined by Valuations analysts. They produce a dollar per square foot rate for
each neighborhood/class combination. This rate is then multiplied by the land square footage of each PIN.
We place a cap on the land value at 50% of the total value of the PIN. This means that if the land value
exceeds this cap, we adjust it down to 50% of the total value. This is in place to ensure the land value
doesn't disproportionately make up the overall value of the PIN.

---

This is a toy example illustrating the process:

![](/Residential/Proration/proration_explainer.PNG)
