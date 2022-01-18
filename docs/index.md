--- 
title: "Introduction to Theoretical Ecology"
author: "Instructor: Po-Ju Ke $~~~~~$ Teaching Assistant: Gen-Chang Hsu"
date: "2021 Fall at National Taiwan Univeristy ![](./bifurcation.gif)"

url: "https://genchanghsu.github.io/2021_Fall_Introduction_to_Theoretical_Ecology/"
github-repo: "GenChangHSU/2021_Fall_Introduction_to_Theoretical_Ecology"
cover-image: "bifurcation.gif"

site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes

description: "This is the course website for **_Introduction to Theoretical Ecology_** 2021 Fall at National Taiwan University."
---



# Course Information {-}

<p style = "font-size: 24pt; margin-bottom: 5px; margin-top: 25px; text-align: center"> **IMPORTANT ANOUNCEMENT!!!** </p>
The first three weeks of this course will be online. We will host the two modules of this course (i.e., 2-hr lecture and 1-hr practice) on different platforms. We will use Google Meet for the lecture section [(link here)](https://meet.google.com/nzd-cdjp-kbt){target="_blank"}. To mimic an environment where we can provide one-on-one coding advice, we will use Gather Town for the hands-on practice section [(link here)](https://gather.town/app/osrqFSf0a7q0I6uo/TheoreticalEcology){target="_blank"}. Please login in advance to make sure it is working; learn how to use Gather Town [here](https://www.youtube.com/watch?v=89at5EvCEvk){target="_blank"}.

For those who wish to enroll manually, please join the first lecture and stay online afterward. Since we have moved to a larger classroom due to COVID-19 regulation, we can accommodate more students. We have asked students to introduce themselves (e.g., research interest and familiarity with R; 1-2 minutes) during the first time we meet online, so please also be prepared if you wish to enroll.

********************************************************************************

<p style = "font-size: 24pt; margin-bottom: 5px; margin-top: 25px"> **Description** </p> The development of theory plays an important role in advancing ecology as a scientific field. This three-unit course is for students at the graduate or advanced undergraduate level. The course will cover classic theoretical topics in ecology, starting from single-species dynamics and gradually build up to multi-species models. The course will primarily focus on population and community ecology, but we will also briefly discuss models in epidemiology and ecosystem ecology. Emphasis will be on theoretical concepts and corresponding mathematical approaches.

This course is designed as a two-hour lecture followed by a one-hour hands-on practice module. In the lecture, we will analyze dynamical models and derive general theories in ecology. In the hands-on practice section, we will use a combination of analytical problem sets, interactive applications, and numerical simulations to gain a general understanding of the dynamics and behavior of different models. 

<p style = "font-size: 24pt; margin-bottom: 5px; margin-top: 25px"> **Objectives** </p>
By the end of the course, students are expected to be familiar with the basic building blocks of ecological models and would be able to formulate and analyze simple models of their own. The hands-on practice component should allow students to link their ecological intuition with the underlying mathematical model, helping them to better understand the primary literature of theoretical ecology. 

<p style = "font-size: 24pt; margin-bottom: 5px; margin-top: 25px"> **Requirements** </p>
Students are expected to have a basic understanding of **Calculus** (e.g., freshman introductory course) and **Ecology**.

<p style = "font-size: 24pt; margin-bottom: 5px; margin-top: 25px"> **Format** </p>
Tuesday 1:20 pm ~ 4:20 pm at Classroom 3C, Life Science Building

- Lecture (two hours): selected topics of ecological theories and models (blackboard writing) 
- Lab (one hour): hands-on practice in programming and simulation (using R) + discussion

<p style = "font-size: 24pt; margin-bottom: 5px; margin-top: 25px"> **Grading** </p>
The final grade consists of:

(1) Assignment problem sets (60%)
(2) Midterm exam (15%)
(3) Final exam (15%)
(4) Course participation (10%)

<p style = "font-size: 24pt; margin-bottom: 5px; margin-top: 25px"> **Course materials** </p>
We will be using a combination of textbooks and literature articles on theoretical ecology in this course. Textbook chapters and additional reading materials will be provided (see **Syllabus** for more details).

Below are the textbook references:

- Case, Ted J. *An illustrated guide to theoretical ecology*. Oxford University Press, 2000.
- Gotelli, Nicholas J. *A primer of ecology 4^th^ edition*. Sinauer Associates, 2008.
- Pastor, John. *Mathematical ecology of populations and ecosystems*. John Wiley & Sons, 2011.
- Otto, Sarah P. and Troy Day. *A biologist's guide to mathematical modeling in ecology and evolution*. Princeton University Press, 2011.

<p style = "font-size: 24pt; margin-bottom: 5px; margin-top: 25px"> **Contacts** </p>
**Instructor**: Po-Ju Ke

- Office: Life Science Building R635
- Email: pojuke@ntu.edu.tw
- Office hours: by appointment

**Teaching assistant**: Gen-Chang Hsu

- Email: b04b01065@ntu.edu.tw
- Office hours: by appointment


# Syllabus {-}

<table class=" lightable-paper table table-bordered" style="font-size: 17px; font-family: Arial; margin-left: auto; margin-right: auto; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;font-weight: bold;color: black !important;font-size: 20px;"> Date </th>
   <th style="text-align:center;font-weight: bold;color: black !important;font-size: 20px;"> Lecture topic </th>
   <th style="text-align:center;font-weight: bold;color: black !important;font-size: 20px;"> Lab </th>
   <th style="text-align:left;font-weight: bold;color: black !important;font-size: 20px;"> Readings </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 1** <span style="vertical-align:-30%"> </span>
           <br> 28-Sept-2021 </td>
   <td style="text-align:center;width: 17em; "> Introduction: what is theoretical ecology? </td>
   <td style="text-align:center;width: 17em; "> \- </td>
   <td style="text-align:left;width: 13em; "> Grainger et al., 2021 </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 2** <span style="vertical-align:-30%"> </span>
           <br> 05-Oct-2021 </td>
   <td style="text-align:center;width: 17em; "> Exponential population growth </td>
   <td style="text-align:center;width: 17em; "> Solving exponential growth equation using "deSolve" &amp; Visualization </td>
   <td style="text-align:left;width: 13em; "> Gotelli [Ch.1] <br> Case [Ch.1] </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 3** <span style="vertical-align:-30%"> </span>
           <br> 12-Oct-2021 </td>
   <td style="text-align:center;width: 17em; "> Logistic population growth and stability analysis </td>
   <td style="text-align:center;width: 17em; "> Solving logistic growth equation using "deSolve" &amp; Visualization </td>
   <td style="text-align:left;width: 13em; "> Gotelli [Ch.2] <br> Case [Ch.5] <br> Otto &amp; Day [Ch.5] </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 4** <span style="vertical-align:-30%"> </span>
           <br> 19-Oct-2021 </td>
   <td style="text-align:center;width: 17em; "> Discrete exponential and logistic models </td>
   <td style="text-align:center;width: 17em; "> Modeling discrete logistic growth using for loops &amp; Visualization </td>
   <td style="text-align:left;width: 13em; "> May, 1976 </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 5** <span style="vertical-align:-30%"> </span>
           <br> 26-Oct-2021 </td>
   <td style="text-align:center;width: 17em; "> Age-structured models </td>
   <td style="text-align:center;width: 17em; "> Analyzing Leslie matrix using for loops and eigenanalysis </td>
   <td style="text-align:left;width: 13em; "> Gotelli [Ch.3] <br> Case[Ch.3] </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 6** <span style="vertical-align:-30%"> </span>
           <br> 02-Nov-2021 </td>
   <td style="text-align:center;width: 17em; "> Metapopulations and patch occupancy models </td>
   <td style="text-align:center;width: 17em; "> Building and analyzing a model on plant-soil dynamics </td>
   <td style="text-align:left;width: 13em; "> Gotelli [Ch.4] <br> Case [Ch.16] </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 7** <span style="vertical-align:-30%"> </span>
           <br> 09-Nov-2021 </td>
   <td style="text-align:center;width: 17em; "> Lotka-Volterra model of competition: graphical analysis </td>
   <td style="text-align:center;width: 17em; "> Visualizing state-phase diagrams of Lotka-Volterra competition model </td>
   <td style="text-align:left;width: 13em; "> Gotelli [Ch.5] <br> Case [Ch.14] </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 8** <span style="vertical-align:-30%"> </span>
           <br> 16-Nov-2021 </td>
   <td style="text-align:center;width: 17em; "> Lotka-Volterra model of competition: linear stability analysis </td>
   <td style="text-align:center;width: 17em; "> Analyzing system dynamics of Lotka-Volterra competition model </td>
   <td style="text-align:left;width: 13em; "> Otto &amp; Day [Ch.8] </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 9** <span style="vertical-align:-30%"> </span>
           <br> 23-Nov-2021 </td>
   <td style="text-align:center;width: 17em; "> Midterm exam </td>
   <td style="text-align:center;width: 17em; "> \- </td>
   <td style="text-align:left;width: 13em; "> $~~~~~~~~~~~~$ \- </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 10** <span style="vertical-align:-30%"> </span>
           <br> 30-Nov-2021 </td>
   <td style="text-align:center;width: 17em; "> Modern coexistence theory &amp; Lotka-Volterra model of predator-prey interactions (1) </td>
   <td style="text-align:center;width: 17em; "> Analyzing Lotka-Volterra model of predator-prey interactions (basic) </td>
   <td style="text-align:left;width: 13em; "> Broekman et al., 2019 </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 11** <span style="vertical-align:-30%"> </span>
           <br> 07-Dec-2021 </td>
   <td style="text-align:center;width: 17em; "> Lotka-Volterra model of predator-prey interactions (2) </td>
   <td style="text-align:center;width: 17em; "> Analyzing Lotka-Volterra model of predator-prey interactions (variants) </td>
   <td style="text-align:left;width: 13em; "> Gotelli [Ch.6] <br> Case [Ch.12 &amp; 13] </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 12** <span style="vertical-align:-30%"> </span>
           <br> 14-Dec-2021 </td>
   <td style="text-align:center;width: 17em; "> Resource competition: R* models </td>
   <td style="text-align:center;width: 17em; "> Analyzing the dynamics of various consumer-resource systems </td>
   <td style="text-align:left;width: 13em; "> Armstrong &amp; McGehee, 1980 <br> Tilman, 1980 </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 13** <span style="vertical-align:-30%"> </span>
           <br> 21-Dec-2021 </td>
   <td style="text-align:center;width: 17em; "> Multispecies models of competition: apparent competition </td>
   <td style="text-align:center;width: 17em; "> Visualizing the area of prey coexistence under apparent competition </td>
   <td style="text-align:left;width: 13em; "> Holt, 1977 </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 14** <span style="vertical-align:-30%"> </span>
           <br> 28-Dec-2021 </td>
   <td style="text-align:center;width: 17em; "> Disease dynamics and SIR models </td>
   <td style="text-align:center;width: 17em; "> Analyzing the SIR model with demography &amp; Visualization </td>
   <td style="text-align:left;width: 13em; "> Anderson &amp; May, 1979 </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 15** <span style="vertical-align:-30%"> </span>
           <br> 04-Jan-2022 </td>
   <td style="text-align:center;width: 17em; "> Course review &amp; open discussion </td>
   <td style="text-align:center;width: 17em; "> \- </td>
   <td style="text-align:left;width: 13em; "> $~~~~~~~~~~~~$ \- </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 10em; border-right:1px solid;"> **Week 16** <span style="vertical-align:-30%"> </span>
           <br> 11-Jan-2022 </td>
   <td style="text-align:center;width: 17em; "> Final exam </td>
   <td style="text-align:center;width: 17em; "> \- </td>
   <td style="text-align:left;width: 13em; "> $~~~~~~~~~~~~$ \- </td>
  </tr>
</tbody>
</table>


