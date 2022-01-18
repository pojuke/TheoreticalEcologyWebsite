

# Week 5 {-} 
<div style = "font-size: 28pt"> **_Age-structured models_**</div>

## Lecture in a nutshell {-}

* **Model derivation:**
    1. Model diagram: a sequence of age classes connected through arrows of survival probability ($Si$) and fecundity ($fi$)
    2. Assumptions:
        * Closed population
        * Individuals within each age class are identical
        * Critical rates are age-dependent **BUT** not time- or density-dependent (unlimited resources)
        * Discrete age classes; individuals do not remain in the same age class over time
    
<div style="height:1px ;"><br></div>

* **Model dynamics (linear algebra):**
    1. A simple example:
        * Age class at time _t_: $\vec{n}_{t} = \begin{vmatrix}n_{1.t} \\ n_{2.t} \\ n_{3.t} \end{vmatrix}$
        * Leslie matrix $L$ (transition matrix): $\begin{vmatrix}f_{1} & f_{2} & f_{3}\\S_{1} & 0 & 0\\0 & S_{2} & 0 \end{vmatrix}$
        * Age class at time _t+1_: $\vec{n}_{t+1} = L \cdot \vec{n}_{t}$
    2. Eigenanalysis: eigenvalues ($\lambda$) and eigenvectors ($\vec{u}$)
        * $L\vec{u} = \lambda\vec{u}; (L - \lambda I)\vec{u} = 0; det|L - \lambda I| = 0$ 
        * Solve for $\lambda$ and find the corresponding $\vec{u}$
    3. Eigendecomposition (for diagonalizable matrix): $L = ADA^{-1}; A = \begin{vmatrix}\vec{u}_{1} & \vec{u}_{2} & \vec{u}_{3} \end{vmatrix}; D = \begin{vmatrix}\lambda_{1} & 0 & 0\\0 & \lambda_{2} & 0\\0 & 0 & \lambda_{3} \end{vmatrix}$
    4.  $L^{t} = AD^{t}A^{-1} \approx A\lambda_{1}^{t}A^{-1}$ ($\lambda_{1}$ is the dominant eigenvalue)
    5. The long-term dynamics of Leslie matrix are determined by:
        * The dominant eigenvalue $\lambda_{1}$: finite rate of increase (asymptotic growth rate)
        * The dominant eigenvector $\vec{u}_{1}$: stable age distribution
<div style="height:1px ;"><br></div>
    6. For an $n \times n$ Leslie matrix, the characteristic equation (Euler-Lotka equation) can be written as: $\sum_{i}^{n} S_{i}f{i}\lambda^{-i} = 1$ 

<div style="height:1px ;"><br></div>

* **Stage-structured models:**
    1. Stages are arbitrarily defined by the user
    2. Individuals can remain in the same stage class or even regress back to previous stage class

<div style="height:1px ;"><br></div> 

<br>

## Lab demonstration {-}

In this lab, we will be analyzing a simple Leslie matrix using for loops + matrix algebra, comparing the results with those obtained via eigenanalysis, and visualizing the population dynamics and age distribution.

**Part 1 - Analyzing Leslie matrix**


```r
library(tidyverse)

### Leslie matrix and initial age classes
leslie_mtrx <- matrix(data = c(0, 1, 5,
                               0.5, 0, 0,
                               0, 0.3, 0),
                      nrow = 3, 
                      ncol = 3,
                      byrow = T)

initial_age <- c(10, 0, 0)

### for loop and matrix algebra
time <- 50
pop_size <- data.frame(Age1 = numeric(time+1),
                       Age2 = numeric(time+1),
                       Age3 = numeric(time+1))
pop_size[1, ] <- initial_age

for (i in 1:time) {
  pop_size[i+1, ] <- leslie_mtrx %*% as.matrix(t(pop_size[i, ]))
}

pop_size <- pop_size %>% 
  round() %>%
  mutate(Total_N = rowSums(.), 
         Time = 0:time) %>%
  relocate(Time)

head(round(pop_size)) 
```

```
##   Time Age1 Age2 Age3 Total_N
## 1    0   10    0    0      10
## 2    1    0    5    0       5
## 3    2    5    0    2       7
## 4    3    8    2    0      10
## 5    4    2    4    1       7
## 6    5    8    1    1      10
```

```r
### Asymptotic growth rate and stable age distribution 
asymptotic_growth <- round(pop_size[time+1, 5]/pop_size[time, 5], 3)
asymptotic_growth
```

```
## [1] 1.091
```

```r
age_distribution <- round(pop_size[time+1, 2:4]/sum(pop_size[time+1, 2:4]), 3)
age_distribution
```

```
##     Age1  Age2  Age3
## 51 0.632 0.289 0.079
```

```r
### Eigenanalysis of the Leslie matrix
eigen_out <- eigen(leslie_mtrx)
as.numeric(eigen_out$values[1]) %>% round(., 3)  # dominant eigenvalue
```

```
## [1] 1.09
```

```r
as.numeric(eigen_out$vectors[, 1]/sum(eigen_out$vectors[, 1])) %>% 
  round(., 3)  # stable age distribution
```

```
## [1] 0.631 0.289 0.080
```

The asymptotic growth rate and stable age distribution obtained from for loops and eigenanalysis are pretty much the same.

<br>

**Part 2 - Visualizing population dynamics and age distribution**





