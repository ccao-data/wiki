# Sandbox Model Evaluation

## Sandbox Overview
The residential modeling sandbox is a tool developed to evaluate and compare the performance of two models simultaneously. The intended audience for this tool is, initially, analysts in the Data Science department who are trying to find the best model (see how best is defined below) for each township, triad, or the whole county. The sandbox currently supports the following functionality:

- Ingesting data from SQL server, Cook County Open Data Portal, using data from the last SQL pull stored locally, or using your own sales sample
- Comparing two different estimation methods (linear model, quantile regression, GBM, or using COMPS data)
- Comparing two different model specifications (i.e. which variables to include)
- Comparing two different sources of data
- Adding a location adjustment factor

After specifying the models the user would like to compare, the user can run the sandbox. The output will be an HTML report the evaluates both models using the criteria described below.

## Sample size
Currently, the residential modeling pipeline models each township separately. The sandbox is also designed to do the same. Going forward, we will be shifting to having one model for the entire county, or one model per triad.

## Output Currently Inluded
### Best Model (WIP): 
Currently this decision is made by only considering two criteria: lowest COD and lowest RMSE. Going forward, this might be revisited to incorporate more metrics in deciding which model performed best.

### Analysis of Sales Ratios: 
This section contains a table displaying the mean and median sales ratio across all townships in the models evaluated. Additionally, it displays the IAAO statistics (COD, PRB, PRD) across townships and by township. For more information on sales ratios and the IAAO statistics, see [here](../sops/sales-ratio-studies.md).

### Overall model performance: 
Since this is a prediction problem, we have included [measures](http://www.sthda.com/english/articles/38-regression-model-validation/158-regression-model-accuracy-metrics-r-square-aic-bic-cp-and-more/) often used to compare various machine learning models. The ones currently implemented are: R-squared (R2), Root Mean Squared Error (RMSE), Mean Absolute Error (MAE), and AIC (Akaike’s Information Criteria. R2, RMSE, and MAE were chosen because they are the most commonly reported measures. RMSE and MAE are in the same unit as the original data, making them more interpretable.

For the definitions below, the following notation will be used:
```math
A dataset has $n$ values of sale price $y_1, y_2, ... y_n$ and each value is associated with a predicted value $f_1, f_2, ... f_n$. 
$\bar{y}$ is defined as the mean of observed sale prices, calculated as
$$
\bar{y} = \frac{1}{n}\sum_{i=1}^{n} y_i
$$
```
**R-squared (R2):**  R-squared, also known as the co-efficient of determination, is the proportion of variation in the outcome that is explained by the predictor variables. In general, the higher the R-squared, the better the model. However, R-squared will almost always increase as more predictor variables are added, so R-squared could be artifically inflated without actually having better explanatory power. For this reason, RMSE and MAE may be more helpful evaluation metrics. R-squared is calculated as follows:


The total sum of squares ($SS_tot$) is:
```math
$$
SS_{tot} = \sum_{i} (y_i - \bar{y})^2
$$
```
The residual sum of squares ($SS_res$) is:

$$
SS_{res} = \sum_{i} (y_i - f_i)^2
$$

Then, $R^2$ is:

$$
R^2 = 1 - \frac{\text{SS_{res}}}{\text{SS_{tot}}}
$$


**Root Mean Squared Error (RMSE):** RMSE is the square root of Mean Squared Error (MSE) which is the average squared difference between observed actual values and the predicted values. The lower the RMSE, the better the model. It is calculated as follows:

$$
RMSE = \sqrt{\frac{\sum_{i=1}^{n} (f_i - y_i)^2}{n}}
$$

**Mean Absolute Error (MAE):** Like RMSE, also measures prediction error. It is the average absolute difference between observed and predicted outcomes, and is less sensitive to outliers than MAE. The lower the MAE, the better the model. It is calculated as follows:

$$
MAE = \frac{\sum_{i=1}^{n} |f_i - y_i|}{n}
$$

**Akaike’s Information Criteria (AIC):** AIC is a metric developed to penalize the inclusion of additional variables to a model. It adds a penalty which increases the error when additional variables are added. The lower the AIC, the better the model. This is only calculated for  regression models, and outputs an NA for GBM models. 

$$
AIC = -2(log-likelihood) + 2K
$$

where $K$ is the number of model parameters and log-likelihood is a measure of model fit. The higher the log-likelihood, the better.

### Bias in error structure: General heteroskedasticity
Current output: Boxplots showing sales ratio by decile of assessed value. Ideally, we want to see similar variance in sales ratios across all deciles of assessed (predicted) value. If not, we likely have heteroskedasticity in our errors.

### Bias in error structure: Bad treatment of time
[Looking](http://www-stat.wharton.upenn.edu/~stine/insr260_2009/lectures/trend.pdf) at residuals by ['order number'](https://online.stat.psu.edu/stat462/node/121/) can help show if there is a time trend, positive serial autocorrelation or negative serial autocorrelation. In our context, we look at sales ratios against various measures of time (sale quarter, sale year, etc.) which the user can specify as a parameter. If sales ratios appear cyclical, linearly increasing or decreasing, or otherwise related to the measure of time specified on the x-axis, it is likely our model is not properly accounting for time.

### Disuniformity: 
We are concerned about discontinuous changes in predicted value. To detect this, we ordered predicted values within a given township, neighborhood, and modeling class and calculated the maximum jump in predicted value. If we have accounted for property and neighborhood characteristics well, we should not see large jumps in predicted values within a given township, neighborhood, and modeling class. 

These maximum jumps in predicted values are displayed graphically using two boxplots to compare the two models. The better model will have smaller maximum jumps in predicted values, as well as lower variance in the distribution of maximum jumps.  

In addition to the boxplot, the same data is presented in a table so the user can see which township, neighborhood, and class have the largest jumps, and between which two PINs we see this jump. This can be used to diagnose possible characteristics our models are not appropriately capturing. 

### Bias in estimates: Spatial auto-correlation (WIP)
To test for Spatial Autocorrelation, we have the Moran's test. Moran's I is computed by regressing model residuals onto spatially lagged model residuals, and it ranges from -1 (negative autocorrelation) to +1 (positive autocorrelation.) A random spatial arrangement of property sale prices would give a Moran's I statistic of 0. The implemented test constructs a list of k nearest neighbors (3 for now) for each PIN, develops a matrix of spatial weights for each of those neighbors, then applies the Moran's test. The p-value of Moran's test tells us whether or not we can reject the null of no spatial autocorrelation.

While this test is functional in the sandbox, it should be interpreted with caution. The model data being used in the sandbox is longitudinal, and we are not yet clear on how spatial autocorrelation works with longitudinal data, since PINs (and their locations) will be repeated in the data. This test would make more sense when conducted on assessment data, which is a prediction at a given point in time and is not longitudinal data. 

Still, to get some measure of spatial autocorrelation in our predicted data, the test is implemented by only keeping the last year of data after running the model and generating predictions. This does not remove duplicates on PINs altogether (e.g. properties might have sold multiple times in a year, or might be repeated for other reasons like Multi Codes) but substantially reduces them.

This is a temporary solution – more work needs to be done on how to properly test for spatial autocorrelation in longitudinal data.


## Output Currently Not Included

### Omitted variable bias - coefficient stability test
Coefficient stability tests are often used to test for omitted variable bias (OVB). While we are concerned about omitted variables to an extent - because we want our predictions to be as accurate as possible, we are significantly less concerned about the bias of any given coefficient since we are not interested in doing causal inference. Additionally, coefficient stability tests can only be done for models which have coefficients, and don't apply to models without coefficients (e.g. GBM models). For this reason, this test has not been implemented.
