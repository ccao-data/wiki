# Model Validation, Interpretation, and Testing Guidelines

After running your model (either with a given set of historic parameters (e.g. those from past years) or with parameters found via cross-validation), You will need to interpret the results.  To do so, you will need to first assess how well the sample data (sales) matches the population (buildings to be assessed), then note any mix of data, practical, or real-world factors that may be impacting your model performance (e.g. 
novel market or time trends), and finally interpret the formal model performance statistics to select the best model (where best means the most accurate + generalizable model, that conforms to IAAO standards).

---
## This Guide Covers
1. Assessing how representative your sales (sample) are, relative to the population (all buildings-to-be-assessed).
   - a. Balance tests
   - b. Visual inspection
   - c. Not missing at random
   - d. Domain specific approach

2. Noting any real-world changes that may impact your model, and/or interactions between data and model that may effect your results.  (Model drift, data drift).
3. Interpreting Model performance (using machine learning and assessment metrics).

---

## 1. Assessing how representative your sales-sample is, relative to the population (all buildings-to-be-assessed).

To ensure that a model can generalize from a sample (the sales data that we train the model on) to the population (all buildings being assessed), we need to check that our sales sample contains buildings that are similar to those in the entire population:  That is, we should generally see buildings with the same composition of features, in the same proportions, in the sales-sample and in the population.  We check for this in several ways (primarily with statistical tests and visual inspections of distributions).

*(Note: if there are factors that cause some properties (and their attendant sale-prices) to be over-represented in the sample, the model will over-index to these types of properties, likely leading to over or under-valuation).*

---

Ways that we test for differences between the sample and the population (and some possible corrections):  In a perfectly matched sample, no feature would predict inclusion/exclusion of a property in the sales-sample. That is, all properties, of all types would have an equal chance of being sold in a given year.   These tests allow us to test that assumption (and to develop possible corrections).

### A. Balance Tests

*(See the "Statistical Tests" section of the model performance report.)*  In a perfectly matched sample, no feature would predict inclusion/exclusion of a property in the sales-sample. Any feature that predicts inclusion in the sales set at a level greater than chance (statistical significance) suggests that this feature is over-or under-represented in the sample and will likely bias your results.  (This is especially the case for features that also turn out to have high shap values in your results).  To check this, we run a simple logistic regression predicting the likelihood-of-a-sale, given a property's features. The resulting p values (for each feature in the report) tells you that a feature predicts inclusion in the sample at a level greater than expected-due-to-chance, while the Beta value gives you a relative sense of the weight (importance) and direction (include vs exclude) of that feature.  (In our report, asterisks, represent statistically significant predictors).  (Low p-values suggest statistical significance, high magnitudes for the Betas suggest a large impact).  When a feature is predictive of inclusion in the sample, this means that your sample is likely biased towards properties with this feature, and may thus value these, or other properties inaccurately.

- **Caveats/Real world observations:**  Our 2026 reports indicate that there may be some imbalance in our sample (see, for example, # of bedrooms, baths, various ACS5 values).  We currently don't correct for this.

- **Caveats/Real world observations/solution:**  As many of our features may be correlated (e.g. baths and bedrooms), or have other interactions (e.g. geography, ACS5, characteristics), and some of those predict inclusion in the sales-sample – we may be underestimating the divergence between our sample and population.  More specifically certain types of buildings in certain neighborhoods may be over-represented in the sales sample.  (We currently don't analyze balance at a neighborhood level).  If we want to address this in the future, we may want to attempt some sort of dimensionality/feature reduction, and then re-run the balance tests on the reduced feature space.  If there are problems with sales-volume, this may be worthwhile.  If needed, one can attempt to apply a correction with Inverse propensity scoring (which upweights the value of errors on under-sampled properties) – (example suggestion for a time sensitive sample IPW here: https://github.com/ccao-data/model-res-avm/issues/297) -  Note this may not drastically improve overall accuracy metrics., but might improve neighborhood or township level performance, in particular vertical equity.

-  To validate your investigations from the balance tests, you can look at the standardized mean differences (between sample + population) for each feature.  (Larger differences = more likely deviation between sample and population).

### B. Visual Inspection

See empirical distributions on the performance report.  The distribution of a feature in the sales-set should visually match those in the population set.  (Note:  We only calculate this at the full sample level, it may differ at the township or neighborhood level, and perhaps ought to be investigated further).  If needed can apply a KS test to see that the feature distributions (between sample and population) are the same.

### C. Non-Missing at Random

"Non-missing at random" means that some feature (or a particular value of a feature) is missing in a way that's correlated with your outcome variable, or some other variable in the dataset.  This can sometimes indicate systemic under-sampling.  In our case, it is somewhat controlled for by the fact that lgbm actually incorporates Nulls as a predictor*, because of this, we currently don't track correlations of nulls as rigorously as we otherwise might, though you can get a sense of the percentage of nulls-by-feature by looking at the "Missingness" heading in the Feature report.

\* (https://medium.com/@andrywmarques/how-lgbm-deals-with-missing-values-bd361636357f. https://coder-wang-uspsa.medium.com/how-do-xgboost-lightgbm-and-catboost-handle-missing-features-e541da94d528)

### D. A Quick Domain Specific Sanity Check

Compare year over year changes in assessed values for sold-and-unsold houses.  (This is documented in the performance report under "Change In and Out of Sample").  The sold and unsold properties should have roughly similar changes in assessed values.

---

## 2. Note any real-world changes that may impact your model, and/or interactions between data and model that may effect your results.  (Model drift, data drift).

This step is less specific, but is useful:  Since our model uses temporal features, are there any recent changes (market trends etc.) that may impact it?  While large changes in major variables (general increases in sales price across the board) should be obvious in the model results, it's useful to think through other dynamics:  For example, have there been changes in preferences (e.g. people moving to the suburbs for more space) that the model should be picking up on?  A useful sanity check for this sort of change is to compare the SHAPS on a newly trained model to a prior model; is the new model picking up the newly important variable (did its SHAP increase)?  To check for data drift over time, you can compare the feature distributions from a recent year to those of a prior (formally, you could do a KS test, though we do not do so currently – you can eyeball the "Distributions of Features" in the feature report).   Note: Since we use a boosted model with historic data, and retrain each year, we are less subject to major problems with data or model drift:  However, this can still pose an issue if we have high temporal volatility and low recent sales volume.

https://www.ibm.com/think/topics/model-drift

---

## 3. Interpret Model Performance Statistics

We calculate several measures to assess the efficacy of the model.  These measures range from more traditional machine learning metrics to assessment-specific metrics.  The machine learning metrics we calculate are RMSE, mDape, and R squared.  The assessment metrics that we calculate and attend to are (primarily) Median Ratio and Coefficient of Dispersion (C.o.D) for accuracy and precision (respectively).  We also supplement our analysis with measures of vertical equity ("how equal are our assessments at all price levels") these are PRB, PRD, and MKI, and ratio curves.  (These assessment metrics are explained in detail in this article: [Mass Appraisal For The Masses: The Basics - by Lars Doucet](https://progressandpoverty.substack.com/p/mass-appraisal-for-the-masses-the) – with the exception of MKI, a reference to which can be found In Chris Berry's ["Reassessing the Property Tax"](https:/law.yale.edu/sites/default/files/area/center/corporate/spring2022_paper_berrychristopher_2-24-22.pdf) - See CCAO's [guide to Sales-Ratio-Studies](https://github.com/ccao-data/wiki/blob/master/SOPs/Sales-Ratio-Studies.md) as well.

Our approach is to fit candidate models using the machine learning (m.l.) metrics, and then compare/evaluate our candidate models based on both the m.l. metrics and the assessment metrics.  We can think of the assessment-specific metrics as both offering acceptable bounds for candidate models* and as a way to "break ties" between models that are otherwise similar in terms of m.l. metrics *(e.g. even if a model shows good m.l. fits, if it is outside the acceptable assessment bounds, we may ignore it).

Note: This discussion presumes a train-test breakout, where we fit the model on a subset of our data (training set) and calculate the performance measures on data that the model has not seen (the test set).  We use this approach to avoid overfitting (see below for specifics) and ensure that our model is generalizable out-of-sample.

---

### Model Fitting: Machine Learning Metrics

**Fitting the model:** We aim to fit the model using proper scoring rules, of which RMSE is our primary measure.

#### RMSE – Root Mean Squared Error

This is generally the metric that we use to formally fit the models.  It is just the mean of the, squared-errors (prediction – forecast), rescaled with a square-root.  Smaller (closer to zero) is better.  Note that since it squares the error (which allows for smooth-model fitting), it will tend to overweight large errors and/or large outliers, (which can be an issue for skewed data, like housing prices).

Note that RMSE works best on normally distributed data, and our data is generally skewed, with high-value outliers.  As such, fitting a model with this measure will tend to regress toward the mean (leading to under-valuations of pricey-properties, and over-valuations of lower-priced properties).  We can adjust for this by using different objective functions (quantile functions, bespoke penalty terms); OR by finding candidate models with low RMSE, but making a final model choice based on ratio-curves and vertical equity measures*.   That said, even after accounting for regression to the mean, we have found RMSE to lead to accurate and reasonably precise models (as judged by other measures) and its status as a proper-scoring rule gives us some safeguards against other biases.

*(For example, perhaps we test two models; one with an additional feature that primarily leads to more accurate valuations for lower valued properties (sale_price < median_sale_price),  given the skew in our data (high value properties contribute proportionally more to RMSE) we might find that this feature doesn't move our RMSE calculation very much, but does improve our vertical equity based on our vertical equity measures.  We could justify selecting the model+new-feature based on their vertical equity improvements, rather than the RMSE alone).*

---

**RMSE interpretability:**  An additional reason to use RMSE is its interpretability.  RMSE is on the same scale as your outcome value, and can be interpreted with reference to the mean, median, and standard deviation of your sample data (either train or test set).  Since RMSE is structurally similar to measures of variability, such as standard deviation (the average distance of sample or population values from the mean), you can often interpret RMSE in relation to SD.  (E.g. If one thinks of the mean as the simplest "model" of a distribution, then one can interpret the standard deviation in a manner similar to RMSE- the average deviation of your observations from your mean.  More complex+accurate models should have an RMSE lower than the standard deviation of your test data).  This insight is also useful for model comparison, as the standard deviation can be used as a baseline, or scale, with which to benchmark RMSE values from candidate models.  (E.g. if two candidate models differ by some magnitude of RMSE  how "large" or "trivial" is that difference, relative to the underlying standard deviation of your sample, or test data?)

See here for further discussion: https://stats.stackexchange.com/questions/242787/how-to-interpret-root-mean-squared-error-rmse-vs-standard-deviation  - more formally, here: Shmueli, G., Bruce, P. C., Stephens, M., & Patel, N. R. (2016). Data Mining for Business Analytics: Concepts, Techniques, and Applications with JMP Pro (3rd Edition). Wiley.

---

#### mDape (Median Absolute Percentage Error)

*(used in Zillow model, discussion here)*
https://www.zillow.com/zestimate/
https://stats.stackexchange.com/questions/596324/is-median-absolute-percentage-error-useless#:~:text=Percentage%20Error%20Asymmetry:%20A%20significant%20drawback%20of,same%20factor%20yields%20only%20a%2050%25%20error.

mDape is a useful sanity check for our models.  Since mDape is a median (of the absolute percentage error of each observation in the test set, (abs((actual-forecast)/actual)*100) ), it is more robust to outliers than other measures, and thus complements RMSE.  Note, we shouldn't use this as an optimization metric (as it is not a proper scoring rule, and treats over-forecasts and underforecasts assymetrically)**, but it is useful for comparing model performance in manner that is more robust to outliers (since it is a median).  For example, in a case where two models differ slightly in their RMSE, we may accept a model with a slightly higher RMSE if it has a lower mDape than its competitor model (This arrangement would likely signal that the other "low RMSE" model might simply be fitting toward some high value outliers, at the expense of the median property).

\**(e.g. suppose our Forecast =2, and the actual value =1; this will cause the APE =100%, Whereas an actual value of 3 (with a forecast of 2) will lead to an APE of 33%).*

---

#### R-squared

We report R-squared because it is a common and somewhat interpretable metric (R square varies between 0 and 1, and values of R squared closer to 1 are generally considered to signify better model fits), however given the myriad problems with R squared ([see here: Is R-squared Useless? | UVA Library](https://library.virginia.edu/data/articles/is-r-squared-useless)) we shouldn't make any model justification decisions based off it.  At most, we can check for consistency with RMSE at local levels (e.g. townships) -  (In cases where there is a discrepancy between goodness of fit as suggested by R-squared vs RMSE – default to the RMSE, and, perhaps investigate reasons for underlying low R-squared (Note that R squared is sensitive to scale, variance, and nonlinearities in the underlying data, so these may be causes of discrepancies between R squared and RMSE).

- R-squared does not measure goodness of fit.
- R-squared does not measure predictive error.
- R-squared does not allow you to compare models using transformed responses.
- R-squared does not measure how one variable explains another (it's not causal).

See also: Shalizi notes https://www.stat.cmu.edu/~cshalizi/mreg/15/lectures/10/lecture-10.pdf

For a more sensible interpretation of goodness-of-fit, (in the spirit of how people think R-squared works) – simply eyeball the table in the model performance report for "Estimate vs Actual (Individual Obs.)"  (look for changes between model estimates and actuals).

---

### Train/Test Splits

We follow a standard train/test split to test our models for overfitting. Overfitting is when our model picks-up spurious correlations in our sample, and erroneously uses those to predict sales.  This makes our model less generalizable.

When we fit the model, we hold out a portion of our sample data (the test-set) and do not train, or fit, the model on that data.  (The training data is the sample data minus the test-set).  We fit the model on the training data and then predict sales for the training data and calculate the model's performance metrics (RMSE, mDape, etc.); we then make predictions on the test data and calculate the test data's performance metrics.  We use the difference between these two sets (train and test metrics) to gauge how much a given model may overfit.

Generally, the wider the difference between these two measures, the more likely it is that the model is overfit.  For example an RMSE of 10k on our sales training predictions, and an RMSE of 179k on the test predictions (with a standard deviation of 180k on both the train and test actual distributions) would very likely indicate that the model is overfit to the training data (because of the large difference between train and test RMSE, especially relative to the standard deviation).

A note:  If we only compare model performance in terms of test sets (e.g. looking at differences in RMSE between two models, without looking at train test splits), we may accidentally select a model that is overfit (even though we are analyzing test-set scores).  For example, if we are looking at the test results from 2 separate models trained on the same train/test splits, and one model has an RMSE of 75k, while a second model has an RMSE of 80k (and the standard deviation for both train test splits is 180k), we might select the first (75k) model.  However, if there is a large difference between the train and test sets for the 75k model (e.g. the train set is RMSE is 10k),  but not for the 80k model (perhaps RMSE for this model's train set is 40k)- we might be less inclined to pick the 75k model (due to the possibility of the 75k model being overfit).  (Note: we wouldn't be able to tell definitively if the 80k model is more generalizable:  we might want to test additional models and see their train/test splits, and test accuracy, to get a better sense of whether the 75k model was anomalous.  That said, the large gap, relative to the 2nd model (and the standard deviation of the underlying data) may be sign enough of overfitting).

Further reading: Bias Variance Trade-off
- https://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff
- https://www.ibm.com/think/topics/bias-variance-tradeoff

---

Finally:  If your sample is not a good match for your population, good train-test splits will only take you so far (it will be hard to generalize any model).  This is because your sample will lack representative training data.  This is why balance tests (see earlier section) are important.

---

### Assessment Metrics

Interpretations and acceptable ranges for assessment metrics can be found here:

https://github.com/ccao-data/wiki/blob/master/SOPs/Sales-Ratio-Studies.md

longer descriptions here: Mass Appraisal For The Masses: The Basics - by Lars Doucet
https://progressandpoverty.substack.com/p/mass-appraisal-for-the-masses-the

---

### Practical Process

Pull all current data, and fit + predict with last years hyper-parameters, This model can act as a baseline for any improvements you may intend to make.  At this stage, you will mostly be using the model reports to check for data-drift (year-over-year changes in features- see the feature-report), model+data drift (changes in shaps) data that is not-missing at random, and balance tests (are some features and property types over-represented?).  You can attempt to make corrections at this stage (e.g. applying IPW to correct for imbalanced features), but most likely you will just have to call this out as a concern in your model.

---

### Tune the Hyperparameters

Carry out a "CV run" with github actions.  This will use a Bayesian optimizer to search for the best-fitting hyper-parameters.  Assess the quality of the model, using the metrics discussed previously. Compare the newly tuned model to the old model.  In addition to the machine learning and assessment metrics, you may wish to look at changes in assessments across townships?  Are they relatively similar across models?  Are there any big swings in one model but not the other?

(If there is no clear better model, but there are swings across differing townships, this may indicate that your models have plateaued and are fitting to local noise.  In this case, you likely need to make a judgement call as to which model to select based on the particular swings/changes and outside information, and call-out the townships with large swings for desk review).
