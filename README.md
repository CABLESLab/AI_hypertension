# Life's Essential 8: Unsupervised Machine Learning and Cluster Characterization

## Overview

This repository contains the Stata code used to identify and characterize cardiovascular health profiles based on the American Heart Association's Life's Essential 8 (LE8) metrics.

The analytical workflow was conducted in Stata and consists of two main stages:

1. Unsupervised machine learning for the identification of cardiovascular health profiles.
2. Inferential and discriminative analyses to characterize the identified clusters according to demographic, socioeconomic, environmental, neighborhood, and contextual factors.

## Software

All primary statistical analyses included in this repository were performed using Stata.

The `.do` files contain the commands required to reproduce the analytical workflow, assuming access to the appropriate analytical dataset and variables.

Because the underlying data may be subject to data-use agreements and access restrictions, the analytic dataset is not distributed in this repository.

## Analytical Workflow

### 1. Unsupervised Machine Learning

The first stage identifies patterns across the Life's Essential 8 metrics, including:

- Diet
- Physical activity
- Nicotine exposure
- Sleep
- Body mass index
- Blood lipids
- Blood glucose
- Blood pressure

The workflow includes:

- Descriptive analyses
- Correlation matrices
- Hierarchical cluster analysis using complete linkage
- Dendrogram inspection
- Evaluation of the number of clusters using cluster stopping rules
- K-medians clustering
- Characterization of the resulting clusters
- Boxplots and descriptive statistics across clusters
- Nonparametric comparisons and post-hoc analyses

Separate clustering procedures are also implemented for:

- All LE8 metrics
- Health behavior metrics
- Health factor metrics

### 2. Cluster Interpretation and Discriminative Analyses

The second stage evaluates the demographic, socioeconomic, environmental, neighborhood, and contextual characteristics associated with the identified clusters.

Analyses include:

- Multinomial logistic regression
- Logistic regression
- Model comparison and information criteria
- Likelihood-ratio testing
- Receiver operating characteristic (ROC) curves
- Area under the ROC curve (AUC)
- Sensitivity and specificity analyses
- Classification performance across probability cutoffs
- Linear discriminant analysis (LDA)

These analyses are used to examine the characteristics of the identified cardiovascular health profiles and the ability of contextual factors to discriminate between cluster memberships.

## Repository Structure

### `_1. IC2_Unsupervised Machine Learning_(creating alghoritm).do`

Performs the unsupervised machine-learning analyses used to identify LE8 cardiovascular health profiles.

### `_2. IC2_Inferential_Discriminative power (Cluster ML)_Interpretation.do`

Performs the subsequent inferential, contextual, and discriminative analyses used to characterize and interpret the identified clusters.

## Data Requirements

To reproduce the analyses, users must have access to the corresponding analytical dataset and variables used in the Stata scripts.

The dataset should include the LE8 cardiovascular health metrics and the demographic, socioeconomic, environmental, neighborhood, and contextual variables specified in the `.do` files.

Variable names in the scripts correspond to the variables used in the original analytical dataset. Users working with other datasets will need to modify the variable names accordingly.

## Running the Analyses

1. Install Stata.
2. Obtain authorized access to the required analytical dataset.
3. Open the relevant `.do` file in the Stata Do-file Editor.
4. Update file paths and dataset locations as necessary.
5. Verify that all required variables and user-written Stata packages are available.
6. Run the first script to generate the cluster solutions.
7. Run the second script to characterize and evaluate the resulting clusters.

The second script depends on cluster variables generated during the unsupervised machine-learning stage and should therefore be run after the first analytical stage.

## Reproducibility

The code is provided to promote transparency and reproducibility of the statistical analyses.

Exact numerical results may depend on the analytical dataset, sample restrictions, missing-data procedures, Stata version, and versions of user-written packages.

## Citation

If you use or adapt this code, please cite the associated publication and this repository.

Publication citation:
[To be added]

Repository citation:
[To be added]

## Authors

Dr. Augusto César F. De Moraes  
Cardiovascular-Brain Health and Lifestyle Epidemiology (CABLES) Lab  
UTHealth Houston School of Public Health in Austin
