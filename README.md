# DBMS-project-2023
This is the final project for the Database course

Group: 
    Jafari
    Faghih
    Imani

Abbreviations:

    Research Activity : R.A
    Research Center : R.C



Notes and assumptions:
    
    1- An institute may handle many research activities, but a research actitvity is related to only one institute

    2- A researcher may have multiple payments (transactions) for working on a R.A (reaserch activity). The data for this will not contain the entire salary of the researcher, as it has already been stored in the researcher-R.A relationship

    3- The correspondense relationship is 1-1 and this constraint is implemented by setting the researcher ID as "notnull" and "unique"

    4- A R.A staff member can also work on another R.A at the same time. 
    (many-many relationship)

    