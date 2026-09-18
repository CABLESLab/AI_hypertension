


**************************** IC2 - SDoH sensitivity *********************

*********************** Creating variables ******************************

**** age ****
recode age_years1 (10/10.99=0 "10 years") (11/11.99=1 "11 years") (12/12.99=2 "12 years") (13/14.99=3 ">= 13 years"), gen(age_years1_cat)
tab age_years1_cat

**** Racism ****
* Generate a categorical variable from the continuous variable
gen racism_category = .
replace racism_category = 1 if reshist_state_racism_factor <= -1.5
replace racism_category = 2 if reshist_state_racism_factor > -1.5 & reshist_state_racism_factor <= -0.5
replace racism_category = 3 if reshist_state_racism_factor > -0.5 & reshist_state_racism_factor <= 0.5
replace racism_category = 4 if reshist_state_racism_factor > 0.5 & reshist_state_racism_factor <= 1.0
replace racism_category = 5 if reshist_state_racism_factor > 1.0

* Label the categories for better interpretation
label define racism_labels 1 "Very Low" 2 "Low" 3 "Medium" 4 "High" 5 "Very High"
label values racism_category racism_labels

* Check the distribution
tabulate racism_category

****** Screen time - binary ***

* Generate the binary variable
gen screen_24h_bin_y2 = screen_24h_2

* Assign value 1 to category 3
replace screen_24h_bin_y2 = . if screen_24h_2 == 99

* Check the distribution of the new binary variable
tabulate screen_24h_bin_y2

****** ML Cluster 3 - binary ***

* Generate the binary variable
gen kmed5st_bh3_bin = 0

* Assign value 1 to category 3
replace kmed5st_bh3_bin = 1 if kmed5st_bh3 == 3

* Check the distribution of the new binary variable
tabulate kmed5st_bh3_bin


**** CVH ****
recode LE8_CVH (0=0 "Low-Moderate CVH") (1=0 "Low-Moderate CVH") (2=1 "High CVH"), gen(LE8_CVH_bin)
tab LE8_CVH_bin


**** Cluster - healthy as condition (cluster4 as condition) ****
recode kmed5st_bh3 (4=1 "cluster4") (1 2 3 5=0 "Other clusters") , gen(kmed5st_bh3_bin4)
tab kmed5st_bh3_bin4


**** Cluster - healthy as base outcome (cluster1 and cluster3 as condition) ****
recode kmed5st_bh3 (2 4 5=0 "Healthy (cluster 2,4,5") (1 3=1 "Unhealthy (cluster 1,3") , gen(kmed5st_bh3_bin_unhel)
tab kmed5st_bh3_bin_unhel

**** Cluster - unhealthy as base outcome (cluster2, cluster4 and cluster5 as condition) ****
recode kmed5st_bh3 (2 4 5=1 "Healthy (cluster 2,4,5") (1 3=0 "Unhealthy (cluster 1,3") , gen(kmed5st_bh3_bin_hel)
tab kmed5st_bh3_bin_hel



**** Cluster - 3 categories (cluster1/3 as condition; cluster2 as intermediate; cluster1/3 as base ****
recode kmed5st_bh3 (4 5=0 "Healthy") (2=1 "intermediate") (1 3=2 "Unhealthy") , gen(kmed5st_bh3_3cat)
tab kmed5st_bh3_3cat





kmed5st_bh3_3cat


**** Variables ****

*** Level 1 - Demographics and economic ***

age_years1_cat sex city race_ethnicity 

family_income mom_educ_y3

*** Level 2 - Environmental and neighboorhood ***
* neighborhood_crime_y_2  - Neighborhood safety (4 items): (https://pmc.ncbi.nlm.nih.gov/articles/PMC10622767/pdf/fpsyt-14-1237163.pdf)
* reshist_state_racism_factor (converted to racism_category) - Structural racism State level indicators 
* reshist_addr1_coi_c5_ed_nat - COI education domain
* reshist_addr1_coi_c5_he_nat - COI health and environment domain
* reshist_addr1_coi_c5_se_nat  - COI SES domain
* reshist_addr1_coi_c5_coi_nat - COI levels
* reshist_addr1_coi_z_coi_nat - COI nationally normed
* COI 2.0 - https://pmc.ncbi.nlm.nih.gov/articles/PMC11855348/pdf/ijerph-22-00228.pdf
neighborhood_crime_y_2

reshist_addr1_coi_c5_ed_nat 

reshist_addr1_coi_c5_he_nat 

reshist_addr1_coi_c5_se_nat 


*** Level 3 - school *** 

*** Level 4 -  ***
racism_category

************** Multinomial logistic regression - External factors *********************
*************************** LR test *****************************************
**** Se o modelo completo tem um ajuste significativamente melhor, então ele tem maior capacidade discriminatória.
*** H₀ (hipótese nula) → O modelo mais simples é tão bom quanto o modelo mais complexo (as variáveis adicionais não melhoram a previsão).
*** H₁ (hipótese alternativa) → O modelo mais complexo se ajusta melhor aos dados (as variáveis adicionais ajudam a discriminar os clusters).
*** Se o p-value do LR Test for < 0.05, rejeitamos H₀ → o modelo mais completo é significativamente melhor.


*** Level 1 - demographics and economic  ***
mlogit kmed5st_bh3 age_years1_cat sex city race_ethnicity family_income mom_educ_y3, baseoutcome(3) rrr
estat ic
est store model_lev1





*** Level 2 - Environment and neighboorhood ********************************
mlogit kmed5st_bh3 age_years1_cat race_ethnicity family_income neighborhood_crime_y_2 reshist_addr1_coi_c5_ed_nat  reshist_addr1_coi_c5_he_nat reshist_addr1_coi_c5_se_nat, baseoutcome(3) rrr
estat ic
est store model_lev2


*** Level 3 - school ***
mlogit kmed5st_bh3 , baseoutcome(2) rrr
estat ic
est store model_lev3

*** Level 4 -  ***
mlogit kmed5st_bh3 age_years1_cat race_ethnicity family_income reshist_addr1_coi_c5_ed_nat racism_category, baseoutcome(2) rrr
estat ic
est store model_lev4


*********************** Level final - Inequalities, Disparities academic context ***********************************
mlogit kmed5st_bh3 i.age_years1_cat i.race_ethnicity i.family_income i.reshist_addr1_coi_c5_ed_nat i.racism_category, baseoutcome(2) rrr
est store model_lev4
lrtest model_lev3 model_levf



********************* Figure 4 - Regression (Accuracy cluster #2) *************************

*** Level 1 ***

logit kmed5st_bh3_bin age_years1_cat sex city race_ethnicity family_income mom_educ_y3
estat ic
lroc

*** Level 2 ***

logit kmed5st_bh3_bin age_years1_cat city race_ethnicity family_income neighborhood_crime_y_2 reshist_addr1_coi_c5_ed_nat  reshist_addr1_coi_c5_he_nat reshist_addr1_coi_c5_se_nat
estat ic
lroc

*** Level 3 ***
logit kmed5st_bh3_bin
estat ic
lroc

*** Level 4 ***
logit kmed5st_bh3_bin age_years1_cat city race_ethnicity family_income reshist_addr1_coi_c5_ed_nat  racism_category 
logit LE8_CVH_bin age_years1_cat city race_ethnicity family_income reshist_addr1_coi_c5_ed_nat racism_category
estat ic
lroc

*** Level - final ***
*** estat classification 0.10 - Cluster2: The overall rate of correct classification is estimated to be 80.00, with 82.10% of the less active group (category: others) correctly classified (specificity) and only 50.00% of the cluster2 group correctly classified (sensitivity). Classification is sensitive to the relative sizes of each component group, and always favors classification into the larger group. This phenomenon is evident here.
logit kmed5st_bh3_bin age_years1_cat city race_ethnicity family_income reshist_addr1_coi_c5_ed_nat racism_category
estat ic
lstat
estat classification, cutoff(.75)
estat classification, cutoff(.20)
estat classification, cutoff(.15)
**** .10 - better tradeff sensitivity/specificity****
estat classification, cutoff(.10)
estat classification, cutoff(.90)

*** lsens - O cutoff de probabilidade define o ponto de decisão do modelo.Cutoffs baixos aumentam sensibilidade (bons para diagnóstico precoce). Cutoffs altos aumentam especificidade (bons para evitar decisões erradas).O melhor cutoff depende do objetivo do modelo (equilíbrio entre falsos positivos e falsos negativos).
*** Sensibilidade (True Positive Rate - TPR) → Capacidade de detectar corretamente os casos positivos. Especificidade (True Negative Rate - TNR) → Capacidade de detectar corretamente os casos negativos.
*** Para cutoffs baixos (~0.1 - 0.2), a sensibilidade é alta, mas a especificidade ainda é baixa. Para cutoffs médios (~0.3 - 0.5), há um cruzamento entre as curvas → melhor equilíbrio entre sensibilidade e especificidade. Para cutoffs altos (~0.7 ou mais), a especificidade atinge 100%, mas a sensibilidade despenca para quase zero → o modelo praticamente não detecta positivos.

*** graph interpretation ***
*** lroc - Sensibilidade (True Positive Rate - TPR) → Quantos casos positivos foram corretamente previstos. Especificidade (False Positive Rate - FPR) → Quantos casos negativos foram erroneamente previstos como positivos. Como interpretar a Curva ROC: A linha diagonal (45°) representa um modelo aleatório (AUC = 0.5), ou seja, um modelo que não discrimina bem os grupos. A área sob a curva (AUC - Area Under the Curve) mede a capacidade do modelo de prever corretamente. Quanto mais a curva ROC se aproxima do canto superior esquerdo, melhor é o modelo.

*** lsens -  Alta especificidade → O modelo distingue bem os negativos, ou seja, há poucos falsos positivos. Baixa sensibilidade → O modelo pode não estar capturando bem os positivos, resultando em muitos falsos negativos. Se o objetivo do modelo for minimizar falsos positivos (alta especificidade), então o desempenho é satisfatório. Se for importante capturar todos os positivos (ex.: diagnóstico de doença), talvez seja necessário ajustar o modelo para aumentar a sensibilidade. A especificidade (curva vermelha) está alta na maior parte da faixa de probabilidade, especialmente em pontos de corte mais altos (~0.2 ou superior). Isso significa que o modelo classifica corretamente a maioria dos negativos (baixa taxa de falsos positivos). A sensibilidade (curva azul) é relativamente baixa para pontos de corte mais altos, o que indica que o modelo pode perder alguns casos positivos (alto falso negativo).

lroc
lsens
lsens, genprob(p) gensens(sens) genspec(spec) nograph
generate predactive30=(p > .30)
lstat

generate predactive20=(p > .20)
lstat

generate predactive10=(p > .10)
lstat

generate predactive90=(p > .90)
lstat

tabulate kmed44st_2 predactive30, row
tabulate kmed44st_2 predactive20, row
tabulate kmed44st_2 predactive10, row
tabulate kmed44st_2 predactive90, row




*********************  Capacidade discriminatoria das variaveis - linear *************************
*** estat classtable, loo nopriors
*** estat list, class(loo) probabilities(loo) misclassified
*** estat loadings, standardized unstandardized
*** scoreplot
*** A análise discriminante linear (LDA - Linear Discriminant Analysis) é usada para avaliar a capacidade de um conjunto de variáveis em prever a classificação de observações em diferentes grupos (clusters). Sensibilidade para "Cluster 2" (Recall dos Positivos) = 55.56% O modelo classificou corretamente 10 de 18 indivíduos pertencentes ao "Cluster 2". Isso significa que 44.44% dos indivíduos do Cluster 2 foram erroneamente classificados como "Others". Especificidade para "Others" (Recall dos Negativos) = 74.60% O modelo classificou corretamente 188 de 252 indivíduos que pertencem à categoria "Others". 25.40% dos "Others" foram incorretamente classificados como "Cluster 2". Conclusão: O modelo tem uma boa precisão para identificar "Others" (74.60%), mas desempenha mal na identificação do "Cluster 2" (55.56%), sugerindo que as variáveis preditoras podem não estar separando bem os grupos.


*** Acuracia = Class corretas/ Total obs > Acuracia = 169 + 15 / 270 = 68.15%. O modelo está cada vez melhor para detectar "Cluster 2" (83.33% de acerto). Por outro lado, está classificando mais indivíduos de "Others" erroneamente como "Cluster 2". A acurácia geral caiu, indicando um "trade-off" entre sensibilidade e especificidade. Se o foco for capturar "Cluster 2", esse modelo é o melhor até agora. Se o objetivo for evitar falsos positivos, o modelo anterior (segundo) era melhor.

discrim lda age_years1_cat race_ethnicity family_income neighborhood_crime_y_2 racism_category, group(kmed5st_bh3_bin)

***** Inputation data showed better tradeoff sensitivity/specificity
*** Acuracia = Class corretas/ Total obs > Acuracia = 234 + 14 / 349 = 71.06%. Se seu objetivo é capturar melhor os indivíduos do "Cluster 2", este modelo é superior ao anterior. Se a prioridade for evitar falsos positivos, talvez seja necessário ajustar os preditores ou um método diferente.
discrim lda cidade_o1_3cat etnia_o1_bin renda_pessoa_o1_3cat curso5_turno_o1_bin, group(kmed44st_2_input)








