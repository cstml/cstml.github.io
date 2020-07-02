---
layout: post
title: Shell Concatenate tex files Script
---



I am currently writing a case study for a Postgraduate Diploma. I chose to use
laTEX because I effectively love the formating I get with it and the control. 

But due to the complexity of the filestructure and to my need to look over the
whole of the filetree, I found myself in great dificulty when it came to
creating a merged file of all the subfiles that I couldd see in 1 place.

This is the solution I found

# Latex File Structure

```bash
tree
```
```

.
├── Main_CaseStudy.pdf
├── Main_CaseStudy.tex
├── Session.vim
├── Structure.tex
├── Untitled.ipynb
├── Untitled.md
├── Untitled.tex
├── cool-awk.awk
├── pdf
│   └── BC.pdf
└── sections
    ├── Disclosure.tex
    ├── Foreword.tex
    ├── TableOfContents.tex
    ├── TitleSheet.tex
    ├── appendix
    │   └── Title.tex
    ├── introduction
    │   ├── Abbreviations.tex
    │   ├── ArchitectureToday.tex
    │   ├── ControlMechanisms.tex
    │   ├── HutOffice.tex
    │   ├── HutTree.txt
    │   ├── RoleAndResponsibilities.tex
    │   └── introduction.tex
    ├── project1
    │   ├── Appointment.tex
    │   ├── AppointmentAndFee.tex
    │   ├── ArchitectAppointment.tex
    │   ├── Brief.tex
    │   ├── Budget.tex
    │   ├── Client.tex
    │   ├── DesignManagement.tex
    │   ├── DesignTeam.tex
    │   ├── ExecutiveSummary.tex
    │   ├── ExistingSiteCondition.tex
    │   ├── Fee.tex
    │   ├── Introduction.tex
    │   ├── PPI.tex
    │   ├── ProcurementStrategy.tex
    │   ├── Programme.tex
    │   ├── RegulatoryMatters.tex
    │   ├── RegulatoryMatters.tex~
    │   ├── RoleAndResponsibilities.tex
    │   ├── Session.vim
    │   ├── Title.tex
    │   └── project1-sesh.vim
    ├── project2
    │   ├── Budget.tex
    │   ├── BuildingRegulations.tex
    │   ├── Client.tex
    │   ├── Conclusion.tex
    │   ├── ExecutiveSummary.tex
    │   ├── ExistingSiteCondition.tex
    │   ├── HealthAndSafety.tex
    │   ├── Introduction.tex
    │   ├── PostMobilisation.tex
    │   ├── Procurement.tex
    │   ├── QualityControl.tex
    │   ├── RoleArchitect.tex
    │   ├── RoleContractor.tex
    │   ├── SiteEvents.tex
    │   ├── Stakeholders.tex
    │   ├── Subcontractor.tex
    │   ├── TenderingAndDocumentation.tex
    │   └── Title.tex
    └── summary
        └── Title.tex

7 directories, 61 files
```


As you can tell, I have many, subfiles spread around many folders.
To add to the whole complexity, when Latex compiles my  source code, the files have their own order which is not alphabetical, but structured. We can see this by looking at the file called **Structure.tex**


```bash
tail Structure.tex
```

```
    \subfile	{sections/project2/BuildingRegulations.tex}
    \subfile	{sections/project2/HealthAndSafety.tex}
    \subfile	{sections/project2/RoleArchitect.tex}
    \subfile	{sections/project2/RoleContractor.tex}
    \subfile	{sections/project2/Subcontractor.tex}
    \subfile	{sections/project2/QualityControl.tex}
    \subfile	{sections/project2/SiteEvents.tex}
    \subfile	{sections/project2/Conclusion.tex}

\subfile {sections/summary/Title.tex}
```

But once you see this nicely laid out **Strucure.tex** file, you can see opportunity. Thus here is the strategy that I came up with :

## Strategy

1) extract the **.tex** file addresses from Structure.tex
2) somehow concatenate all of them in an orderly manner
3) Output to a unique .txt file

## Step 1

In order to extract the address of the file I used `awk`, a great unix tool.


```bash
awk '{split($0,a,"{"); split(a[2],b,"}"); print b[1]}' Structure.tex
```

```
sections/TitleSheet.tex


sections/Disclosure.tex


sections/Foreword.tex


sections/TableOfContents.tex


sections/introduction/Abbreviations.tex


sections/introduction/Introduction.tex
sections/introduction/ArchitectureToday.tex
sections/introduction/HutOffice.tex
sections/introduction/ControlMechanisms.tex
sections/introduction/RoleAndResponsibilities.tex

sections/project1/Title.tex
sections/project1/ExecutiveSummary.tex
sections/project1/Introduction.tex
sections/project1/ExistingSiteCondition.tex
sections/project1/Client.tex
sections/project1/Budget.tex
sections/project1/Appointment.tex
sections/project1/AppointmentAndFee.tex
sections/project1/ArchitectAppointment.tex
sections/project1/Fee

sections/project1/Brief.tex
sections/project1/RoleAndResponsibilities.tex

sections/project1/PPI.tex
sections/project1/ProcurementStrategy.tex
sections/project1/DesignTeam.tex
sections/project1/Programme.tex

sections/project1/RegulatoryMatters.tex
sections/project1/DesignManagement.tex

sections/project2/Title.tex
sections/project2/ExecutiveSummary.tex
sections/project2/Introduction.tex
sections/project2/Stakeholders.tex
sections/project2/ExistingSiteCondition.tex

sections/project2/Procurement.tex
sections/project2/Budget.tex
sections/project2/TenderingAndDocumentation.tex

sections/project2/PostMobilisation.tex
sections/project2/BuildingRegulations.tex
sections/project2/HealthAndSafety.tex
sections/project2/RoleArchitect.tex
sections/project2/RoleContractor.tex
sections/project2/Subcontractor.tex
sections/project2/QualityControl.tex
sections/project2/SiteEvents.tex
sections/project2/Conclusion.tex

sections/summary/Title.tex
```

## Step 2

As you can see, the problem now is that the output contains many empty lines. To solve this I used `grep -v` which outputs the file without any 

`grep -v -e '^$' `

```
sections/TitleSheet.tex
sections/Disclosure.tex
sections/Foreword.tex
sections/TableOfContents.tex
sections/introduction/Abbreviations.tex
sections/introduction/Introduction.tex
sections/introduction/ArchitectureToday.tex
sections/introduction/HutOffice.tex
sections/introduction/ControlMechanisms.tex
sections/introduction/RoleAndResponsibilities.tex
sections/project1/Title.tex
sections/project1/ExecutiveSummary.tex
sections/project1/Introduction.tex
sections/project1/ExistingSiteCondition.tex
sections/project1/Client.tex
sections/project1/Budget.tex
sections/project1/Appointment.tex
sections/project1/AppointmentAndFee.tex
sections/project1/ArchitectAppointment.tex
sections/project1/Fee
sections/project1/Brief.tex
sections/project1/RoleAndResponsibilities.tex
sections/project1/PPI.tex
sections/project1/ProcurementStrategy.tex
sections/project1/DesignTeam.tex
sections/project1/Programme.tex
sections/project1/RegulatoryMatters.tex
sections/project1/DesignManagement.tex
sections/project2/Title.tex
sections/project2/ExecutiveSummary.tex
sections/project2/Introduction.tex
sections/project2/Stakeholders.tex
sections/project2/ExistingSiteCondition.tex
sections/project2/Procurement.tex
sections/project2/Budget.tex
sections/project2/TenderingAndDocumentation.tex
sections/project2/PostMobilisation.tex
sections/project2/BuildingRegulations.tex
sections/project2/HealthAndSafety.tex
sections/project2/RoleArchitect.tex
sections/project2/RoleContractor.tex
sections/project2/Subcontractor.tex
sections/project2/QualityControl.tex
sections/project2/SiteEvents.tex
sections/project2/Conclusion.tex
sections/summary/Title.tex
```

## Step 3 

We need to take this and save it to an output file: 

` > addresses.tmp `

#### All together now 

`awk '{split($0,a,"{"); split(a[2],b,"}"); print b[1]}' Structure.tex | grep -v -e '^$' > addresses.tmp`

## Step 4

Now we use `cat` to read the files opened by another `cat` utility. 

> The discovery of nesting `cat`s like this was a real eye opener for me in terms of posibilities

` cat $(cat addresses.tmp) >> united.tex`

And that was it. Now for convenience let's try and create a Shell Script for it.

# Shell script version

```
#!/bin/bash
# A script that reads the addresses from Structure.tex and concatenates the
# contents into one file
cat $(
   awk '{
       split ( $0 , a , "{" );
       split ( a[2] , b , "}" );
       print b[1]
   }' Structure.tex |
   grep -v -e "^$") >> united.tex
```

