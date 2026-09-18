
**************************************************************
*                 ABCD IC2 - Analysis                        *
**************************************************************

****************** Open ABCD dataset *************************

set memory 500k
set maxvar 120000
set more on


reshist_addr1_walkindex

***************** School variables **************************
School environment, School involvement, and School disengagement: These variables were assessed using the School Risk and Protective Factors questionnaire (SRPF)34, which evaluates perceptions of the school general environment, amount of school involvement, and the degree to which the youth is disengaged from school35. Adapted from the Communities That Care Youth Survey, this measure includes 12 items that produce scores for three summary variables: School Environment (6 items), School Involvement (4 items), and School Disengagement (2 items)35. An examination of the psychometric properties of this scale in an initial ABCD sample indicated that all three scales demonstrated discriminant validity in distinguishing between higher-risk and lower-risk youth34. Additionally, the school environment and school involvement subscales showed adequate internal reliability34.

***************** LE8 - variables (scoring) ******************

*** Diet ***

LE8_diet_points

*** Physical Activity ***

LE8_physact

*** Nicotine Exposure ***

LE8_smoke

*** Sleep ***

LE8_sleep

*** BMI ***

LE8_obesity_y2

*** Blood lipids ***

LE8_lipids_y2

*** Blood Glucose ***

LE8_hba1c_y2

*** Blood pressure ***

LE8_BP_y2

*** LE8 - behaviors ***

LE8_behaviors 

*** LE8 - health *** 

LE8_health

***************** Describing variables ***********************

tab1 LE8_diet_points LE8_physact LE8_smoke LE8_sleep LE8_obesity_y2 LE8_lipids_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2

sum LE8_diet_points LE8_physact LE8_smoke LE8_sleep LE8_obesity_y2 LE8_lipids_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2


tab1 LE8_behaviors LE8_health 



************* Unsupervised Machine Learning - Alghoritm LE8 all metrics ***********

******** Correlation matrix ***********

graph matrix LE8_BP_y2 LE8_diet_points LE8_physact LE8_smoke LE8_sleep LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 

******** Hierarchical method - Cluster analysis with completelinkage (maximum distance from furthest neighbor) ***********
cluster completelinkage LE8_BP_y2 LE8_diet_points LE8_physact LE8_smoke LE8_sleep LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 , name(vhmovst)

cluster list vhmovst

cluster dendrogram vhmovst, cutnumber(15)

cluster tree, showcount horizontal cutnumber(5)

cluster dendrogram vhmovst2, cutnumber(15)

*** Hierarchical method - Number of Clusters analysis (solution>F) ***********
*** The conventional wisdom for deciding the number of groups based on the Duda–Hart stopping-rule table is to find one of the largest Je(2)/Je(1) values that corresponds to a low pseudo-T 2 value that has much larger T2 values next to it.
*** 3 clusters identified ***
cluster stop vhmovst, rule(calinski)

cluster stop vhmovst, rule(duda)

******** K median method - Creating variables based on group cluster ***********

*** Hierarchical method - Number of Clusters analysis (solution>F) ***

cluster kmed LE8_BP_y2 LE8_diet_points LE8_physact LE8_smoke LE8_sleep LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2, k(4) name(kmed4st) measure(abs) start(kr(93947))

tab kmed4st 



************* Unsupervised Machine Learning - Alghoritm LE8 health behaviors ***********

******** Correlation matrix ***********

graph matrix LE8_diet_points LE8_physact LE8_smoke LE8_sleep

******** Hierarchical method - Cluster analysis with completelinkage (maximum distance from furthest neighbor) ***********
cluster completelinkage LE8_diet_points LE8_physact LE8_smoke LE8_sleep, name(vhmovst_bh)

cluster list vhmovst_bh

cluster dendrogram vhmovst_bh, cutnumber(15)

cluster tree, showcount horizontal cutnumber(8)

*** Hierarchical method - Number of Clusters analysis (solution>F) ***********
*** The conventional wisdom for deciding the number of groups based on the Duda–Hart stopping-rule table is to find one of the largest Je(2)/Je(1) values that corresponds to a low pseudo-T 2 value that has much larger T2 values next to it.
*** 3 clusters identified ***
cluster stop vhmovst_bh, rule(calinski)

cluster stop vhmovst_bh, rule(duda)

******** K median method - Creating variables based on group cluster ***********

*** Hierarchical method - Number of Clusters analysis (solution>F) ***

cluster kmed LE8_diet_points LE8_physact LE8_smoke LE8_sleep, k(5) name(kmed5st_bh3) measure(abs) start(kr(93947))

tab kmed5st_bh3



************* Unsupervised Machine Learning - Alghoritm LE8 health ***********

******** Correlation matrix ***********

graph matrix LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2

******** Hierarchical method - Cluster analysis with completelinkage (maximum distance from furthest neighbor) ***********
cluster completelinkage LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2, name(vhmovst_he)

cluster list vhmovst_he

cluster dendrogram vhmovst_he, cutnumber(15)

cluster tree, showcount horizontal cutnumber(10)

*** Hierarchical method - Number of Clusters analysis (solution>F) ***********
*** The conventional wisdom for deciding the number of groups based on the Duda–Hart stopping-rule table is to find one of the largest Je(2)/Je(1) values that corresponds to a low pseudo-T 2 value that has much larger T2 values next to it.
*** 3 clusters identified ***
cluster stop vhmovst_he, rule(calinski)

cluster stop vhmovst_he, rule(duda)

******** K median method - Creating variables based on group cluster ***********

*** Hierarchical method - Number of Clusters analysis (solution>F) ***

cluster kmed LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2, k(2) name(kmed2st_he) measure(abs) start(kr(93947))

tab kmed2st_he

cluster kmed LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2, k(6) name(kmed6st_he) measure(abs) start(kr(93947))

tab kmed6st_he




******** Graphic of kmedian clusters (behaviors & health )**********

******** Graphic of kmedian clusters - boxplot**********
graph hbox LE8_diet_points LE8_physact LE8_smoke LE8_sleep, over(kmed4st)

graph hbox LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2 , over(kmed4st)

**** Kruskall-Wallis*****
sort kmed4st

tabstat LE8_diet_points, by(kmed4st) stat(n mean sd median p25 p75)
dunntest LE8_diet_points, by(kmed4st) ma(bonferroni)

tabstat LE8_physact, by(kmed4st) stat(n mean sd median p25 p75)
dunntest LE8_physact, by(kmed4st) ma(bonferroni)

tabstat LE8_smoke, by(kmed4st) stat(n mean sd median p25 p75) 
dunntest LE8_smoke, by(kmed4st) ma(bonferroni)

tabstat LE8_sleep, by(kmed4st) stat(n mean sd median p25 p75) 
dunntest LE8_sleep, by(kmed4st) ma(bonferroni)

tabstat LE8_obesity_y2, by(kmed4st) stat(n mean sd median p25 p75)
dunntest LE8_obesity_y2, by(kmed4st) ma(bonferroni)

tabstat LE8_lipids_y2, by(kmed4st) stat(n mean sd median p25 p75)
dunntest LE8_lipids_y2, by(kmed4st) ma(bonferroni)

tabstat LE8_hba1c_y2, by(kmed4st) stat(n mean sd median p25 p75)  
dunntest LE8_hba1c_y2, by(kmed4st) ma(bonferroni)

tabstat LE8_BP_y2, by(kmed4st) stat(n mean sd median p25 p75)   
dunntest LE8_BP_y2, by(kmed4st) ma(bonferroni)



******** Graphic of kmedian clusters  (behaviors)**********

******** Graphic of kmedian clusters - boxplot**********
graph hbox LE8_diet_points LE8_physact LE8_smoke LE8_sleep, over(kmed5st_bh3)

graph hbox LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2, over(kmed5st_bh3)

**** Kruskall-Wallis*****
sort kmed5st_bh3

tabstat LE8_diet_points, by(kmed5st_bh3) stat(n mean sd median p25 p75)
dunntest LE8_diet_points, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_physact, by(kmed5st_bh3) stat(n mean sd median p25 p75)
dunntest LE8_physact, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_smoke, by(kmed5st_bh3) stat(n mean sd median p25 p75) 
dunntest LE8_smoke, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_sleep, by(kmed5st_bh3) stat(n mean sd median p25 p75) 
dunntest LE8_sleep, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_obesity_y2, by(kmed5st_bh3) stat(n mean sd median p25 p75)
dunntest LE8_obesity_y2, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_lipids_y2, by(kmed5st_bh3) stat(n mean sd median p25 p75)
dunntest LE8_lipids_y2, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_hba1c_y2, by(kmed5st_bh3) stat(n mean sd median p25 p75)  
dunntest LE8_hba1c_y2, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_BP_y2, by(kmed5st_bh3) stat(n mean sd median p25 p75)   
dunntest LE8_BP_y2, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_behaviors, by(kmed5st_bh3) stat(n mean sd median p25 p75)   
dunntest LE8_behaviors, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_health, by(kmed5st_bh3) stat(n mean sd median p25 p75)   
dunntest LE8_health, by(kmed5st_bh3) ma(bonferroni)

tabstat LE8_total, by(kmed5st_bh3) stat(n mean sd median p25 p75)   
dunntest LE8_total, by(kmed5st_bh3) ma(bonferroni)

******** Graphic of kmedian clusters (health)**********

******** Graphic of kmedian clusters - boxplot (2 clusters)**********
graph hbox LE8_diet_points LE8_physact LE8_smoke LE8_sleep, over(kmed2st_he)

graph hbox LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2 , over(kmed2st_he)

**** Kruskall-Wallis*****
sort kmed2st_he

tabstat LE8_diet_points, by(kmed2st_he) stat(n mean sd median p25 p75)
ranksum LE8_diet_points, by(kmed2st_he)

tabstat LE8_physact, by(kmed2st_he) stat(n mean sd median p25 p75)
ranksum LE8_physact, by(kmed2st_he)

tabstat LE8_smoke, by(kmed2st_he) stat(n mean sd median p25 p75)
ranksum LE8_smoke, by(kmed2st_he)

tabstat LE8_sleep, by(kmed2st_he) stat(n mean sd median p25 p75)
ranksum LE8_sleep, by(kmed2st_he)

tabstat LE8_obesity_y2, by(kmed2st_he) stat(n mean sd median p25 p75)
ranksum LE8_obesity_y2, by(kmed2st_he)

tabstat LE8_lipids_y2, by(kmed2st_he) stat(n mean sd median p25 p75)
ranksum LE8_lipids_y2, by(kmed2st_he)

tabstat LE8_hba1c_y2, by(kmed2st_he) stat(n mean sd median p25 p75)
ranksum LE8_hba1c_y2, by(kmed2st_he)

tabstat LE8_BP_y2, by(kmed2st_he) stat(n mean sd median p25 p75)
ranksum LE8_BP_y2, by(kmed2st_he)


******** Graphic of kmedian clusters - boxplot (6 clusters)**********
graph hbox LE8_diet_points LE8_physact LE8_smoke LE8_sleep, over(kmed6st_he)

graph hbox LE8_obesity_y2 LE8_lipids_y2 LE8_hba1c_y2 LE8_BP_y2 , over(kmed6st_he)

**** Kruskall-Wallis*****
sort kmed6st_he

tabstat LE8_diet_points, by(kmed6st_he) stat(n mean sd median p25 p75)
dunntest LE8_diet_points, by(kmed6st_he) ma(bonferroni)

tabstat LE8_physact, by(kmed6st_he) stat(n mean sd median p25 p75)
dunntest LE8_physact, by(kmed6st_he) ma(bonferroni)

tabstat LE8_smoke, by(kmed6st_he) stat(n mean sd median p25 p75) 
dunntest LE8_smoke, by(kmed6st_he) ma(bonferroni)

tabstat LE8_sleep, by(kmed6st_he) stat(n mean sd median p25 p75) 
dunntest LE8_sleep, by(kmed6st_he) ma(bonferroni)

tabstat LE8_obesity_y2, by(kmed6st_he) stat(n mean sd median p25 p75)
dunntest LE8_obesity_y2, by(kmed6st_he) ma(bonferroni)

tabstat LE8_lipids_y2, by(kmed6st_he) stat(n mean sd median p25 p75)
dunntest LE8_lipids_y2, by(kmed6st_he) ma(bonferroni)

tabstat LE8_hba1c_y2, by(kmed6st_he) stat(n mean sd median p25 p75)  
dunntest LE8_hba1c_y2, by(kmed6st_he) ma(bonferroni)

tabstat LE8_BP_y2, by(kmed6st_he) stat(n mean sd median p25 p75)   
dunntest LE8_BP_y2, by(kmed6st_he) ma(bonferroni)

