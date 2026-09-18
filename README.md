# Machine Learning and Statistical Analysis for Pediatric Hypertension and Cardiovascular-Brain Health

## Overview

This repository contains the analytical code developed for the study of pediatric hypertension, cardiovascular health, and related brain health outcomes.

The analytical workflow combines **Stata** and **Python** and includes data preparation, descriptive and inferential statistics, unsupervised machine learning, predictive modeling, cluster characterization, model evaluation, and calibration.

The analyses were designed to investigate cardiovascular health profiles based on the American Heart Association's Life's Essential 8 (LE8) metrics and to evaluate demographic, socioeconomic, environmental, neighborhood, behavioral, and health-related factors associated with pediatric hypertension and cardiovascular-brain health outcomes.

## Software

Analyses included in this repository were performed using:

- **Stata** — data management, descriptive analyses, statistical modeling, cluster analysis, inferential analyses, and additional epidemiological analyses.
- **Python** — machine-learning pipelines, predictive modeling, model validation, class-imbalance procedures, leakage prevention, performance assessment, and calibration.

Stata analyses are primarily provided as `.do` files, while Python analyses are provided as `.ipynb` Jupyter/Google Colab notebooks or `.py` scripts when applicable.

The code is intended to reproduce the analytical workflow assuming authorized access to the corresponding analytical datasets and variables.

Because the underlying data are subject to data-use agreements and access restrictions, individual-level analytical datasets are **not distributed in this repository**.

## Analytical Workflow

### 1. Data Preparation and Statistical Analysis

Stata code is used for data management and statistical analyses required throughout the project.

These procedures may include:

- Data cleaning and management
- Variable recoding and derivation
- Descriptive statistics
- Distribution assessment
- Bivariate analyses
- Longitudinal data preparation
- Regression modeling
- Inferential analyses
- Statistical visualization
- Preparation of analytical variables for subsequent machine-learning analyses

### 2. Unsupervised Machine Learning and Cardiovascular Health Profiles

The unsupervised machine-learning component identifies patterns across the American Heart Association's Life's Essential 8 metrics, including:

- Diet
- Physical activity
- Nicotine exposure
- Sleep
- Body mass index
- Blood lipids
- Blood glucose
- Blood pressure

The analytical workflow includes:

- Descriptive analyses
- Correlation matrices
- Hierarchical cluster analysis
- Dendrogram inspection
- Evaluation of alternative cluster solutions
- Cluster stopping rules
- K-medians clustering
- Characterization of resulting clusters
- Visualization of cardiovascular health profiles
- Nonparametric comparisons and post-hoc analyses

Separate clustering procedures may be implemented for:

- All LE8 metrics
- Health behavior metrics
- Health factor metrics

### 3. Cluster Characterization and Discriminative Analyses

Following cluster identification, inferential analyses are used to characterize the resulting cardiovascular health profiles according to demographic, socioeconomic, environmental, neighborhood, and contextual characteristics.

Analyses may include:

- Multinomial logistic regression
- Logistic regression
- Model comparison and information criteria
- Likelihood-ratio testing
- Receiver operating characteristic (ROC) curves
- Area under the ROC curve (AUC)
- Sensitivity and specificity
- Classification performance across probability thresholds
- Linear discriminant analysis (LDA)

These analyses examine factors associated with cardiovascular health profile membership and assess the ability of selected characteristics to discriminate between identified profiles.

### 4. Machine Learning for Pediatric Hypertension Prediction

Python-based machine-learning workflows are used to develop and evaluate predictive models for pediatric hypertension and related cardiovascular outcomes.

The predictive modeling workflow may include:

- Data preprocessing
- Feature selection and engineering
- Training and validation procedures
- Classification algorithms
- Hyperparameter optimization
- Management of imbalanced outcome classes
- Minority-class prediction assessment
- Prevention of information leakage
- Cross-validation
- Model discrimination
- Model calibration
- Comparison of predictive algorithms

Particular attention is given to the evaluation of hypertension as a potentially imbalanced outcome. Model performance is therefore assessed using multiple complementary metrics rather than overall classification accuracy alone.

### 5. Model Performance and Validation

Predictive models are evaluated using appropriate measures of discrimination, classification performance, and calibration.

Depending on the specific analysis, these may include:

- ROC curves
- Area under the ROC curve (AUC)
- Sensitivity
- Specificity
- Positive and negative predictive performance
- Confusion matrices
- Precision and recall
- F1 score
- Calibration assessment
- Cross-validation performance

The specific metrics and validation procedures used for each analysis are documented within the corresponding Stata or Python code.

## Repository Structure

The repository contains analytical scripts organized according to the major stages of the study.

### Stata Code

Stata `.do` files contain data-management, epidemiological, statistical, clustering, inferential, and discriminative analyses.

Examples include:

#### `1_IC2_Unsupervised_Machine_Learning.do`

Performs the unsupervised machine-learning analyses used to identify cardiovascular health profiles based on the Life's Essential 8 metrics.

#### `2_IC2_Inferential_Discriminative_Power.do`

Performs inferential, contextual, and discriminative analyses used to characterize and interpret the identified cardiovascular health profiles.

### Python Code

Python notebooks contain machine-learning analyses for pediatric hypertension prediction and related predictive modeling tasks.

Examples include:

#### `01_aim1_hypertension_ml.ipynb`

Implements the machine-learning workflow for pediatric hypertension prediction, including procedures related to class imbalance, leakage prevention, model evaluation, and calibration.

Additional Stata and Python scripts may be added as the analytical workflow and study objectives are expanded.

## Data Requirements

To reproduce the analyses, users must have authorized access to the corresponding analytical datasets.

Depending on the analysis, required variables may include:

- Life's Essential 8 cardiovascular health metrics
- Blood pressure and hypertension measures
- Demographic characteristics
- Socioeconomic indicators
- Behavioral factors
- Environmental measures
- Neighborhood and contextual characteristics
- Cardiometabolic measures
- Brain and cognitive outcomes
- Longitudinal follow-up information

Variable names used in the scripts correspond to those in the original analytical datasets. Users applying these workflows to other datasets will need to modify variable names, file paths, and data-processing procedures accordingly.

## Running the Analyses

### Stata

1. Install an appropriate version of Stata.
2. Obtain authorized access to the required analytical dataset.
3. Open the corresponding `.do` file in the Stata Do-file Editor.
4. Update local file paths and dataset locations.
5. Verify that all required variables are available.
6. Install any required user-written Stata packages identified in the scripts.
7. Run the analytical scripts in the indicated sequence.

Some Stata scripts depend on variables or analytical outputs generated by previous scripts. The order of execution should therefore be maintained when indicated.

### Python

1. Install Python or open the notebook in Jupyter Notebook, JupyterLab, or Google Colab.
2. Obtain authorized access to the required analytical dataset.
3. Open the corresponding `.ipynb` notebook.
4. Update file paths and data locations as necessary.
5. Install the required Python libraries.
6. Verify that the required variables are available.
7. Run the notebook sequentially from data preprocessing through model evaluation.

Machine-learning preprocessing, resampling, feature selection, and model tuning procedures should be performed within the appropriate training and validation framework to prevent information leakage.

## Reproducibility

The code is provided to promote transparency, reproducibility, and reuse of the analytical methods.

Exact numerical results may depend on:

- Analytical dataset version
- Sample inclusion and exclusion criteria
- Missing-data procedures
- Variable definitions
- Random seeds
- Training/test partitions
- Cross-validation procedures
- Stata version
- Python version
- Versions of Stata user-written packages
- Versions of Python libraries

Where applicable, random seeds and analytical parameters are specified within the individual scripts or notebooks to facilitate reproducibility.

## Data Availability

The analytical code is publicly available through this repository.

The individual-level data used in these analyses are not included because access may be governed by institutional requirements, data-use agreements, and/or study-specific access policies.

Researchers interested in reproducing the analyses should obtain the appropriate data directly through the corresponding study data-access procedures.

## Authors

**Dr. Augusto César F. De Moraes**  
**Dr. Marcus V. Nascimento-Ferreira**  
**Dr. Tiago A. Oliveira**  
Cardiovascular-Brain Health and Lifestyle Epidemiology (CABLES) Lab  
UTHealth Houston School of Public Health – Austin Campus
