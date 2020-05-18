# Sandbox Model Evaluation

## Sandbox Overview





## Sample size

## Output Currently Inluded
### Best Model (WIP): 
Currently this decision is made by only considering two criteria: lowest COD and lowest RMSE. Going forward, this might be revisited to incorporate more metrics in deciding which model performed best.

### Analysis of Sales Ratios: 
This section contains a table displaying the mean and median sales ratio across all townships in the models evaluated. Additionally, it displays the IAAO statistics (COD, PRB, PRD) across townships and by township. For more information on sales ratios and the IAAO statistics, see [here](../sops/sales-ratio-studies.md).

### Overall model performance: 
Since this is a prediction problem, we have included [measures](http://www.sthda.com/english/articles/38-regression-model-validation/158-regression-model-accuracy-metrics-r-square-aic-bic-cp-and-more/) often used to compare various machine learning models.

The ones currently implemented are: R-squared (R2), Root Mean Squared Error (RMSE), Mean Absolute Error (MAE), and AIC (Akaike’s Information Criteria). 

For the definitions below, the following notation will be used:

A dataset has $n$ values of sale price $y_1, y_2, ... y_n$ and each value is associated with a predicted value $f_1, f_2, ... f_n$. 

$\bar{y}$ is defined as the mean of observed sale prices, calculated as

$$
\bar{y} = \frac{1}{n}\sum_{i=1}^{n} y_i
$$


**R-squared (R2):**  R-squared, also known as the co-efficient of determination, is the proportion of variation in the outcome that is explained by the predictor variables. In general, the higher the R-squared, the better the model. However, R-squared will almost always increase as more predictor variables are added, so R-squared could be artifically inflated without actually having better explanatory power. For this reason, RMSE and MAE may be more helpful evaluation metrics. R-squared is calculated as follows:


The total sum of squares ($SS_tot$) is:

$$
SS_tot = \sum_{i} (y_i - \bar{y})^2
$$

The residual sum of squares ($SS_res$) is:

$$
SS_res = \sum_{i} (y_i - f_i)^2
$$

Then, $R^2$ is:

$$
R^2 = 1 - \frac{\text{SS_res}}{\text{SS_tot}}
$$


**RMSE:**


The last one is only computed for linear regression models and gives an NA for GBM models. R2, RMSE, and MAE were chosen because they are the most commonly reported measures. RMSE and MAE are in the same unit as the original data, making them more interpretable.



### Bias in error structure: General heteroskedasticity
Current output: Boxplots showing sales ratio by decile of assessed value. Ideally, we want to see similar variance in sales ratio across all deciles of assessed (predicted) value. If not, we likely have heteroskedasticity in our errors

### Bias in error structure: Bad treatment of time
Current output: Boxplots showing sales ratio by different measurements of time (sale quarter, sale year, etc. which user can specify as a parameter). Based on some [reading](http://www-stat.wharton.upenn.edu/~stine/insr260_2009/lectures/trend.pdf) I did looking at residuals by ['order number'](https://online.stat.psu.edu/stat462/node/121/) can help show if there is a time trend, positive serial autocorrelation or negative serial autocorrelation. In our context, I decided to do Sales Ratios against our various time measures. In some of the models I tested with and without sale_quarter, there's a very clear cyclical pattern that emerges in the model that doesn’t account for time.

### Disuniformity: 
Discontinuous changes in predicted value with regard to primary regressors.
Current output: 
1.	Table showing greatest jump in predicted value within a town, neighborhood, and class (since these properties should be most similar)
2.	To compare the two models graphically, there's also a plot showing the spread of Maximum Jumps in Predicted Values. The better model will have lower variance and lower absolute value for the maximum jumps within town, neighborhood, and class

### Bias in estimates: Spatial auto-correlation (WIP)
To test for Spatial Autocorrelation, we have the Moran's test. Moran's I is computed by regressing model residuals onto spatially lagged model residuals, and it ranges from -1 (negative autocorrelation) to +1 (positive autocorrelation.) A random spatial arrangement of property sale prices would give a Moran's I statistic of 0. The implemented test constructs a list of k nearest neighbors (3 for now) for each PIN, develops a matrix of spatial weights for each of those neighbors, then applies the Moran's test. The p-value of Moran's test tells us whether or not we can reject the null of no spatial autocorrelation.

While this test is functional in the sandbox, it should be interpreted with caution. The model data being used in the sandbox is longitudinal, and we are not exactly clear on how spatial autocorrelation works with longitudinal data, since PINs (and their locations) will be repeated in the data. This test would make more sense when conducted on assessment data, which is a prediction at a given point in time and is not longitudinal data. 

Still, to get some measure of spatial autocorrelation in our predicted data, the test is implemented by only keeping the last year of data after running the model and generating predictions. This does not remove duplicates on PINs altogether (e.g. properties might have sold multiple times in a year, or might be repeated for other reasons like Multi Codes) but substantially reduces them.

This is a temporary solution – more work needs to be done on how to properly test for spatial autocorrelation in longitudinal data.


## Output Currently Not Included

### Omitted variable bias - coefficient stability test
I looked into this, and I'm not sure this test makes sense for models without coefficients (e.g. GBM). Also, I'm not sure how much value this adds for models that do have coefficients. By my understanding, the coefficient stability test is useful and implemented when doing causal inference, and trying to understand how adding more variables changes the value of a given Beta_hat that we care about. If adding more variables changes Beta_hat a lot, we likely have omitted variable bias.

In our case, I don't think we're focusing on causal inference or the effect of a specific Beta_hat, since we're more interested in doing predictions. Based on some things I read, it also seems like people in the ML / prediction space care less about omitted variable bias generally. 

If we still want to include this for the models that have coefficients, I could iteratively add all the coefficients and see how they evolve with the addition of new variables, but I wanted to check in before doing this because I'm not sure of its value.


