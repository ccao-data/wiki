# Model Validation, Interpretation, and Testing Guidelines

After running the model you will need to interpret the results. First, assess how well the sample data (sales sample, training data) matches the population (assessment set, all parcels to be assessed), then note any factors that may be impacting your model performance such as data issues or novel market trends. Finally, interpret the formal model performance statistics to select the most accurate and generalizable model, that conforms to IAAO standards.

**Overview:**

1. Assessing how representative your sales sample is of the assessment set.
   - a. Balance tests
   - b. Visual inspection
   - c. Not missing at random
   - d. Domain specific approach

2. Noting any real-world housing market changes that may impact your model, and/or interactions between data and model that may affect your results (model drift, data drift).

3. Interpreting model performance (evaluating machine learning and assessment metrics).

---

## 1. Assessing How Representative Your Sales Sample Is of the Assessment Set

To ensure that a model can generalize from a sample to the population, we need to check that our sales sample contains buildings that are similar to those in the entire population. We should generally see parcels with the same composition of features, in the same proportions, in the sales (sample) and assessment set (population). We check for this with statistical tests and visual inspections of distributions.

> **Note:** If there are factors that cause some parcels to be over-represented in the sales sample, the model will over-index to these types of properties, likely leading to over- or undervaluation.

### Testing for and Correcting Differences Between Sales (Sample) and the Assessment Set (Population)

In a perfectly matched sample, no feature would predict whether a parcel is more or less likely to be part of the sales sample — all properties of all types would have an equal chance of being sold in a given year. These tests allow us to test that assumption and to develop possible corrections:

#### I. Balance Tests

(See the "Statistical Tests" section of the model performance report.) Any feature that significantly predicts inclusion in the sales sample is likely over- or under-represented in the sample and will likely bias results. This is especially the case for features that also turn out to have high SHAP values. The p-value for each feature in the report tells you whether that feature predicts inclusion in the sales sample at a level greater than expected, while the Beta value gives you a relative sense of the weight (importance) and direction (include vs exclude) of that feature. In our report, asterisks represent statistically significant predictors.

- **a.** Our 2026 reports indicate that there may be some imbalance in our sample (see, for example, # of bedrooms, baths, various ACS5 values). We currently don't correct for this.

- **b.** Many of our features may be correlated (baths and bedrooms) or interact with one another (geography, ACS5, characteristics), and some of those predict inclusion in the sales sample. We may be underestimating the divergence between the sales sample and assessment set, and certain types of buildings in certain neighborhoods may be over-represented in the sales sample. We don't currently analyze balance at a neighborhood level. We may want to attempt some sort of dimensionality/feature reduction and then re-run the balance tests on the reduced feature space. One potential option is to apply a correction with inverse propensity weighting (IPW), which upweights the value of errors on under-sampled properties. Note that this may not drastically improve overall accuracy metrics, but might improve neighborhood or township level performance, in particular vertical equity.

- **c.** To validate your investigations from the balance tests, look at the standardized mean differences between the sales sample and assessment set for each feature. Larger differences indicate a more likely deviation between the sales sample and assessment set.

#### II. Visual Inspection

See empirical distributions on the performance report. The distribution of a feature in the sales sample should visually match those in the assessment set. We only calculate this for the full sales sample, but it may differ at the township or neighborhood-level. We could apply a KS test to check if the feature distributions between the sales sample and assessment set are the same.

#### III. Missing Not at Random

"Missing not at random" means that some feature or a particular value of a feature is missing in a way that's correlated with the outcome variable or another variable in the dataset. This can indicate systemic undersampling. In our case, it is somewhat controlled for by the fact that lgbm actually incorporates missing values as a predictor\*. Because of this we currently don't track correlations of nulls as rigorously as we otherwise might, though you can get a sense of the percentage of missingness for each feature by looking at the "Missingness" heading in the Feature report.

> \* See: [How does LGBM deal with missing values?](https://medium.com/@andrywmarques/how-lgbm-deals-with-missing-values-bd361636357f) (docs)[https://lightgbm.readthedocs.io/en/latest/Advanced-Topics.html#missing-value-handle] | [How do XGBoost, LightGBM, and CatBoost Handle Missing Features?](https://coder-wang-uspsa.medium.com/how-do-xgboost-lightgbm-and-catboost-handle-missing-features-e541da94d528)

#### IV. Domain Specific Sanity Check

Compare year-over-year changes in assessed values for sold and unsold houses. This is documented in the performance report under "Change In and Out of Sample". 

The sold and unsold properties should have roughly similar changes in assessed values, on the assumption that sold and unsold properties have similar characteristics and assessment histories.

---

## 2. Note Any Housing Market Trends That May Impact Your Model

Note any housing market trends that may impact your model and/or interactions between data and model that may affect your results (model drift, data drift). Since our model uses temporal features, are there any recent trends that may impact it? While large changes in major sale prices should be obvious in the model results, it's useful to compare changes in the model's assignment of feature importance (SHAP, gain) to trends in the sales sample (example: changing consumer preferences across years should be reflected in changes in SHAPs between models trained on data from separate years). To check for data drift over time, you can compare the feature distributions from a recent year to those of a prior year. Formally, you could do a KS test, though we do not currently. Less formally you could eyeball the "Distributions of Features" in the feature report.

> **Note:** Since we use a boosted model with historic data and retrain each year, we are less subject to major problems with data or model drift. However, this can still pose an issue if we have high temporal volatility and low recent sales volume.

See: https://www.ibm.com/think/topics/model-drift

---

## 3. Interpreting Model Performance Statistics

We calculate traditional machine learning metrics and assessment-specific metrics to assess the model. The machine learning metrics we calculate are RMSE, MdAPE, and R-squared. The assessment metrics that we calculate and attend to are Median Ratio and Coefficient of Dispersion (COD) for accuracy and precision (respectively). We supplement our analysis with measures of vertical equity (how equal are assessments at all price levels). These are PRB, PRD, MKI, and ratio curves. These assessment metrics are explained in detail in [Mass Appraisal For The Masses: The Basics by Lars Doucet](https://progressandpoverty.substack.com/p/mass-appraisal-for-the-masses-the). MKI is outlined in depth in [A Gini measure for vertical equity in property assessments](https://doi.org/10.63642/1357-1419.1225). See also our guide to ratio studies: https://github.com/ccao-data/wiki/blob/master/SOPs/Sales-Ratio-Studies.md

Our approach is to fit candidate models using the machine learning (ML) metrics then compare/evaluate our candidate models based on both the ML metrics and the assessment metrics. We can think of the assessment metrics as acceptable bounds for candidate models and as a way to "break ties" between models that are otherwise similar in terms of ML metrics. For example, if a model shows good ML fits but is outside the acceptable assessment bounds, we might ignore it.

> **Note:** This discussion presumes a train-test breakout, where we fit the model on a subset of our data (training set) and calculate the performance measures on data that the model has not seen (the test set). We use this approach to avoid overfitting (see below for specifics) and ensure that our model is generalizable out-of-sample.


### Model Fitting — Machine Learning Metrics

#### Fitting the Model

We aim to fit the model using proper scoring rules, of which RMSE is our primary measure.

#### RMSE (Root Mean Squared Error)

This is generally the metric that we use to formally fit the models. It is the mean of the squared errors, rescaled with a square-root. Closer to zero is better. Note that since it squares the error it can penalize larger errors more heavily, which can particularly be an issue for skewed data like housing prices.

RMSE works best on normally distributed data and our data is generally skewed, with high-value outliers. Fitting a model with this measure will tend to regress toward the mean, leading to under-valuations of pricey properties, and over-valuations of lower-priced properties. We can adjust for this by using different objective functions (quantile functions, bespoke penalty terms) or by finding several candidate models with low RMSE and making a final model choice based on ratio-curves and vertical equity measures. Despite regression to the mean, we have found RMSE to lead to accurate and precise models and its status as a proper-scoring rule safeguards against other biases.

As an example of the interplay between RMSE and assessment metrics, suppose we test a model with an additional feature that leads to more accurate valuations for properties with sale prices below the median. Given the skew in our data (high value properties contribute proportionally more to RMSE) we might find that this feature doesn't move our RMSE calculation very much but does improve vertical equity. We could justify selecting the model with the new feature based on its vertical equity improvements, rather than RMSE alone.

**RMSE interpretability:** An additional reason to use RMSE is its interpretability. RMSE is on the same scale as the outcome value, and can be interpreted with reference to the mean, median, and standard deviation of the sales sample. Since RMSE is structurally similar to measures of variability such as standard deviation, you can interpret RMSE in relation to standard deviation. (If one thinks of the mean as the simplest "model" of a distribution, then one can interpret the standard deviation in a manner similar to RMSE — the average deviation of your observations from your mean.) More accurate models should have an RMSE lower than the standard deviation of your test data. This insight is also useful for model comparison, as the standard deviation can be used as a baseline to benchmark RMSE values from candidate models. (For example, if two candidate models differ by some magnitude of RMSE, how "large" or "trivial" is that difference, relative to the underlying standard deviation of your sample, or test data?)

Further discussion [here](https://stats.stackexchange.com/questions/242787/how-to-interpret-root-mean-squared-error-rmse-vs-standard-deviation) — more formally, here: [Shmueli, G., Bruce, P. C., Stephens, M., & Patel, N. R. (2016). *Data Mining for Business Analytics: Concepts, Techniques, and Applications with JMP Pro* (3rd Edition). Wiley.](https://www.amazon.fr/Data-Mining-Business-Analytics-Applications/dp/1118877438/)

MdAPE

Median absolute percentage error (MdAPE) is a [median-based metric](https://support.numxl.com/hc/en-us/articles/115001223503-MdAPE-Median-Absolute-Percentage-Error). It is more robust to outliers than other measures and complements RMSE. We shouldn't use MdAPE as an optimization metric as it is not a proper scoring rule, and treats over-forecasts and under-forecasts asymmetrically, but it is useful for comparing model performance in a manner that is more robust to outliers. For example, in a case where two models differ slightly in RMSE, we may accept a model with a slightly higher RMSE if it has a lower MdAPE. This arrangement would likely signal that the other "low RMSE" model might simply be fitting toward some high value outliers at the expense of the median property.

#### R-Squared

We report R-squared because it is a common and somewhat interpretable metric. R-squared varies between 0 and 1, and values of R-squared closer to 1 may suggest better model fits. Given the myriad problems with R-squared (see: [Is R-squared Useless? | UVA Library](https://library.virginia.edu/data/articles/is-r-squared-useless)) we shouldn't base any model decisions off it. At most we can check for consistency with RMSE within reporting geographies. In cases where there is a discrepancy between goodness-of-fit as suggested by R-squared and RMSE, default to the RMSE and investigate reasons for the difference with the R-squared. R-squared is sensitive to scale, variance, and nonlinearities in the underlying data, so these may be causes of discrepancies between R-squared and RMSE.

- R-squared does not necessarily measure goodness-of-fit.
- R-squared does not necessarily measure predictive error.
- R-squared does not measure how one variable explains another (it's not causal).

See [Shalizi notes](https://www.stat.cmu.edu/~cshalizi/mreg/15/lectures/10/lecture-10.pdf)

For a more sensible interpretation of goodness-of-fit, simply eyeball the table in the model performance report Estimate vs Actual (Individual Obs.). Look for changes between model estimates and actuals.

### Train/Test Splits

We follow a standard [train/test split](https://github.com/ccao-data/model-res-avm/#using-training_data) to test our models for overfitting. Overfitting occurs when a model picks up spurious correlations in the training sample and uses those to predict sales. In other words, overfitting occurs when a model studies the training sample so deeply it loses the ability to generalize predictions to properties that are different from the training set. An overfit model will do a good job predicting on the sample it was trained on but will perform worse on observations it has never seen. The ability of a model to handle situations it hasn't seen is called its "generalizability". A good model is one that can generalize its predictions, such that it reasonably accurately predicts the sale prices of properties it has not been trained on.

When we fit the model we hold out a portion of our sample data, the test set. We do not train, or fit, the model on the test set. The training data is the sample data minus the test set. We fit the model on the training data and then predict sales for both the training data and the test set, then calculate the model's performance metrics (RMSE, mDape, etc.) for both. We use the difference between these two sets (train and test metrics) to gauge how much the model is overfit.

Generally, the larger the difference between these two measures the more likely it is that the model is overfit. An RMSE of $10k on our sales training predictions and an RMSE of $179k on the test predictions with a standard deviation of $180k on both the train and test actual distributions would indicate that the model is overfit to the training data (because of the large difference between train and test RMSE, especially relative to the standard deviation).

> **Note:** If we only compare model performance in terms of test sets (that is, by looking at differences in RMSE between the test sets for two models, without looking at train/test splits), we may accidentally select a model that is overfit even though we are analyzing test-set scores. For example, for two separate models trained on the same train/test splits, one model has an RMSE of $75k and the other has an RMSE of $80k. The standard deviation for both train-test splits is $180k. We might be inclined to select the first ($75k) model, but if there is a larger difference between the train and test sets for the $75k RMSE model (whose hypothetical train-set RMSE is $10k) versus that of the $80k RMSE model (whose hypothetical train-set RMSE is $40k), we should consider the possibility that the $75k model is overfit. While the large gap, relative to the 2nd model and the standard deviation of the underlying data may be sign enough of overfitting, we can't tell definitively if the $80k model is more generalizable and we would want to test additional models to get a better sense of whether the $75k model was anomalous.

Further reading — [Bias Variance Trade-off](https://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff), [IBM's notes](https://www.ibm.com/think/topics/bias-variance-tradeoff)

> **Finally:** If your sample is not a good match for your population, good train-test splits will only take you so far. This is because your sample lacks representative training data. This is why balance tests (see earlier section) are important.

### Assessment Metrics

Interpretations and acceptable ranges for assessment metrics can be found [here.](https://github.com/ccao-data/wiki/blob/master/SOPs/Sales-Ratio-Studies.md)

Longer descriptions here: [Mass Appraisal For The Masses: The Basics — by Lars Doucet](https://progressandpoverty.substack.com/p/mass-appraisal-for-the-masses-the)

---

## Practical Process

1. **Pull all current data** then train and predict with last year's hyperparameters. This model can act as a baseline for any improvements you may intend to make. At this stage, you can use the model reports to check for year-over-year changes in features in the feature report, changes in feature importance (SHAP values, gain, etc.), data that is not-missing-at-random, and parity in feature distributions between the sales sample and the assessment set (balance tests). You can attempt to make corrections like IPW at this stage, but most likely you will just have to note these issues as concerns in your model.

2. **Tune the hyperparameters:** Carry out a "CV run" with GitHub Actions. This will use a Bayesian optimizer to search for the best fitting hyperparameters, using cross-validation. Assess the quality of the model, using the metrics outlined above. Compare the newly tuned model to the old model. In addition to the machine learning and assessment metrics, look at changes in assessments across townships. Are they relatively similar across models? Are there any big swings in one model but not the other?

3. **If there is no clearly better model**, but there are swings in ML or assessment metrics across differing townships, this may indicate that your models have plateaued and are fitting to local noise. In this case, you likely need to make a judgement call as to which model to select based on the particular swings/changes and outside information and mention any instabilities or deviations (across models) in your desk review email.
