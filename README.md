# DBMS-project-2023
This is the final project for the Database course

Group: 
    Jafari
    Faghih
    Imani

.mwb is the data model file that contains all the tables created using MySQL Workbench. You can import it by: Workbench: File> Open Model>> select the file.   

Abbreviations:

    :Research Activity : R.A
    :Research Center : R.C

    :INTL? : Boolean showing wether the execution level of a R.A is domestic or intl.

    :TRID : Transaction ID



Notes and assumptions:
    
    1- An institute may handle many research activities, but a research actitvity is related to only one institute

    2- A researcher may have multiple payments (transactions) for working on a R.A (reaserch activity). The data for this will not contain the entire salary of the researcher, as it has already been stored in the researcher-R.A relationship

    3- The correspondense relationship is 1-1 and this constraint is implemented by setting the researcher ID as "notnull" and "unique"

    4- A R.A staff member can also work on another R.A at the same time. 
    (many-many relationship)

    5- A single relation has been created for staff members. Since we are the company handling research activities, we do not need to create different relations with different access levels for each single inst or EXEstaff. One relation is enough, and we can specify which one(R.A staff or INST-staff) a staff member is using boolean column.

    6- The specialization of the R.A entity is done by using bool columns for each of the R.A types. Time and place columns are also added to the R.A relation.

    7- A R.A is conducted by 1/many research centers.
    8- A R.A is worked on by 1/many researchers.

    9- Researchers work on a R.A through the Agreement Relation. They have 1/many duties for each agreement and a role for each agreement. Each agreement has a total salary.

    10- Financial History of an inst consists of the transactions that have been made by, or to, the inst. TRID is the transaction ID. It is the PK. Transaction type is a text field which can have a domain as required (i.e Salary payment, Equipment purchase, ...). Amount is a signed value which is the amount gained through the transaction. A positive value would imply a transaction made to the inst, and a negative value would mean a transaction made by the inst, or in other words money spent.