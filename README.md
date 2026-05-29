# A New Exponentiated Power Transform Generalized (EPT-G) Family of Distributions

## Overview
This repository contains the theoretical development, computational implementation, and empirical evaluation of the **Exponentiated Power Transform Generalized (EPT-G) Family of Distributions**, developed as part of an MPhil research project in Mathematics.

The study introduces a novel generator known as the **Exponentiated Power Transform (EPT)**, which extends existing generalized distribution families by incorporating additional shape parameters to improve flexibility in modeling complex datasets characterized by skewness, heavy tails, and diverse hazard rate structures.

A special case of the family, the **Exponentiated Power Transform Weibull (EPT-W) Distribution**, is derived and investigated in detail.

---

## Research Title

**A New EPT-G Family of Distributions: Properties, Applications and Machine Learning Benchmarking**

---

## Research Objectives

The main objectives of this project are:

* Develop the Exponentiated Power Transform Generalized (EPT-G) family of distributions.
* Derive the Exponentiated Power Transform Weibull (EPT-W) distribution as a special case.
* Investigate important statistical properties of the EPT-W distribution.
* Apply the proposed model to real-world datasets.
* Compare the performance of EPT-W with modern machine learning density estimation techniques.

---

## Proposed EPT-G Family

The cumulative distribution function (CDF) of the EPT-G family is defined as

[
F(x;\alpha,\beta,\xi)=
\frac{1-\exp\left[-\alpha G(x;\xi)^{\beta}\right]}
{1-\exp(-\alpha)}
]

where

* (G(x;\xi)) is the baseline distribution CDF,
* (\alpha > 0) is a shape parameter,
* (\beta > 0) is a shape parameter,
* (\xi) denotes the baseline distribution parameters.

---

## Exponentiated Power Transform Weibull Distribution (EPT-W)

Using the Weibull distribution as the baseline model,

[
G(x)=1-\exp\left[-\left(\frac{x}{\lambda}\right)^k\right]
]

the EPT-W distribution is obtained.

The model introduces additional flexibility for modeling:

* Right-skewed data
* Heavy-tailed phenomena
* Reliability data
* Survival times
* Biomedical observations
* Financial datasets

---

## Statistical Properties Derived

The following theoretical properties have been developed:

### Distribution Functions

* Probability Density Function (PDF)
* Cumulative Distribution Function (CDF)
* Survival Function
* Hazard Rate Function

### Mathematical Properties

* Quantile Function
* Series Expansion Representation
* Mixture Representation
* Non-central Moments
* Central Moments
* Incomplete Moments
* Moment Generating Function (MGF)
* Rényi Entropy
* Order Statistics
* Stress-Strength Reliability

### Shape Characteristics

* Galton's Skewness
* Moors' Kurtosis

---

## Visualization

The repository includes R implementations for generating:

* PDF plots
* CDF plots
* Survival function plots
* Hazard function plots
* Quantile plots
* 3D Galton Skewness surfaces
* 3D Moors Kurtosis surfaces
* Rényi Entropy analyses

---

## Computational Tools

The project is implemented primarily in:

* **R Programming Language**
* Numerical Optimization (BFGS Algorithm)
* Maximum Likelihood Estimation (MLE)
* Statistical Computing

Packages used include:

```r    
stats
plotly
pracma
numDeriv
bbmle
```

---

## Machine Learning Benchmarking

The EPT-W distribution will be benchmarked against selected machine learning density estimation approaches using:

* Cross-validation
* Information criteria
* Goodness-of-fit measures
* Predictive performance metrics

Potential benchmark models include:

* Kernel Density Estimation (KDE)
* Gaussian Mixture Models (GMM)
* Random Forest-based estimators
* Neural Density Estimators


---

## Applications

The EPT-G family can be applied in:

* Reliability Engineering
* Survival Analysis
* Actuarial Science
* Risk Analysis
* Biomedical Studies
* Financial Modeling
* Environmental Data Analysis

---

## Author

**Benjamin Arkoh Donkoh**

MPhil Candidate, Mathematics

Faculty of Computing and Mathematical Sciences

University of Mines and Technology (UMaT)

Tarkwa, Ghana

---

## Supervisors

* Associate Professor Joseph Acquah
* Dr. Abdulzeid Anafo

---

## Citation

If you use any part of this work, please cite:

```bibtex
@mastersthesis{donkoh2026eptg,
  author  = {Donkoh, Benjamin Arkoh},
  title   = {A New EPT-G Family of Distributions: Properties, Applications and Machine Learning Benchmarking},
  school  = {University of Mines and Technology},
  year    = {2026},
  address = {Tarkwa, Ghana}
}
```
