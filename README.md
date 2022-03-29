<style>
h1 {text-align: center;}
</style>

# Class 2018 - Thesis project


## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)
4. [Collaboration](#collaboration)
5. [FAQs](#faqs)

### General Info
***
The project's goal is to make a bank system. It is made up of 4 different mini-projects coming together:
- Central bank server + administration application (WPF)
- Bank Teller application (WPF)
- Website (Angular) for online banking
- POS terminal (Arduino/ESP) 

[Repository(GitHub)](https://github.com/codingburgas/class-2018-projects-csharp-mssevov18)

The files bellow are accessible only to people in my organisation:

[Documentation(Word)](https://codingburgas.sharepoint.com/:w:/s/2122-2-30/ESG3UAwYEXdCrsHEd-DobaQBsfJp7P_1Byy4rbw8ArguqQ?e=AotrXe)

[Final Presentation(PowerPoint) - not made yet]()

[Idea Presentation(PowerPoint)](https://codingburgas.sharepoint.com/:p:/s/2122-2-30/EVzo7CyfR4ZApYsOZzpkBdUB-u_uJ-zX4bBVTqsXyad8Rw?e=Au4Liq)

### Status


### Screenshot
![Use case diagram](https://westeurope1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fcodingburgas-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!6ouZqlXjtEmzVooyiLuMYcYcu13Xcl1On2YH6zAs1H72XTBZjjZmS4Qaeikg85b1%2Fitems%2F01WFUEKFJR3YN3KBU2DNF2QYGAAIEHS2TE%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29kaW5nYnVyZ2FzLW15LnNoYXJlcG9pbnQuY29tQDVlNmNmZDRiLTEyZDMtNGJhNC04ZWE5LTE5ZGIxOTVhYmRhNCIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NDg1NjYwMDAiLCJleHAiOiIxNjQ4NTg3NjAwIiwiZW5kcG9pbnR1cmwiOiIvZnNkMXYyWEVuZFRwcGFaWndJUk1QaEV0NXAxazNTNVBUdTNzODBiWkhzPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTIyIiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWVdFNU9UaGlaV0V0WlRNMU5TMDBPV0kwTFdJek5UWXRPR0V6TWpnNFltSTRZell4Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxtc3Nldm92MThAY29kaW5nYnVyZ2FzLmJnIiwibmlpIjoibWljcm9zb2Z0LnNoYXJlcG9pbnQiLCJpc3VzZXIiOiJ0cnVlIiwiY2FjaGVrZXkiOiIwaC5mfG1lbWJlcnNoaXB8MTAwM2JmZmRhZGZjMTFkMEBsaXZlLmNvbSIsInNlc3Npb25pZCI6IjU3YzFjYzk5LWE4YjUtNGNkZC05NmJmLWVkNmZiNmNjMjM5ZSIsInR0IjoiMCIsInVzZVBlcnNpc3RlbnRDb29raWUiOiIzIiwiaXBhZGRyIjoiODMuMjI4Ljk3LjIwMyJ9.UDkrTUVWWDdqNWlUTm5kYzB0aEd1UlJKdG1nSGZqZW9ZNGNLV2hNRFlVQT0&cTag=%22c%3A%7BB51BDE31-9A06-4B1B-A860-C00208796A64%7D%2C1%22&encodeFailures=1&width=1920&height=888&srcWidth=&srcHeight=)
![ER Diagram](https://westeurope1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=png&cs=fFNQTw&docid=https%3A%2F%2Fcodingburgas-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!6ouZqlXjtEmzVooyiLuMYcYcu13Xcl1On2YH6zAs1H72XTBZjjZmS4Qaeikg85b1%2Fitems%2F01WFUEKFJBGHBMKQFMIFCJ2SO2APOPRTDJ%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29kaW5nYnVyZ2FzLW15LnNoYXJlcG9pbnQuY29tQDVlNmNmZDRiLTEyZDMtNGJhNC04ZWE5LTE5ZGIxOTVhYmRhNCIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NDg1NjYwMDAiLCJleHAiOiIxNjQ4NTg3NjAwIiwiZW5kcG9pbnR1cmwiOiIvZnNkMXYyWEVuZFRwcGFaWndJUk1QaEV0NXAxazNTNVBUdTNzODBiWkhzPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTIyIiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWVdFNU9UaGlaV0V0WlRNMU5TMDBPV0kwTFdJek5UWXRPR0V6TWpnNFltSTRZell4Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxtc3Nldm92MThAY29kaW5nYnVyZ2FzLmJnIiwibmlpIjoibWljcm9zb2Z0LnNoYXJlcG9pbnQiLCJpc3VzZXIiOiJ0cnVlIiwiY2FjaGVrZXkiOiIwaC5mfG1lbWJlcnNoaXB8MTAwM2JmZmRhZGZjMTFkMEBsaXZlLmNvbSIsInNlc3Npb25pZCI6IjU3YzFjYzk5LWE4YjUtNGNkZC05NmJmLWVkNmZiNmNjMjM5ZSIsInR0IjoiMCIsInVzZVBlcnNpc3RlbnRDb29raWUiOiIzIiwiaXBhZGRyIjoiODMuMjI4Ljk3LjIwMyJ9.UDkrTUVWWDdqNWlUTm5kYzB0aEd1UlJKdG1nSGZqZW9ZNGNLV2hNRFlVQT0&cTag=%22c%3A%7BC5C23121-AC40-4441-9D49-DA03DCF8CC69%7D%2C1%22&encodeFailures=1&width=1920&height=888&srcWidth=&srcHeight=)
![Model front view](https://westeurope1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=jpg&cs=fFNQTw&docid=https%3A%2F%2Fcodingburgas-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!6ouZqlXjtEmzVooyiLuMYcYcu13Xcl1On2YH6zAs1H72XTBZjjZmS4Qaeikg85b1%2Fitems%2F01WFUEKFIVR5U4NUSJWRA23STFIOIMDTNO%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29kaW5nYnVyZ2FzLW15LnNoYXJlcG9pbnQuY29tQDVlNmNmZDRiLTEyZDMtNGJhNC04ZWE5LTE5ZGIxOTVhYmRhNCIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NDg1NjYwMDAiLCJleHAiOiIxNjQ4NTg3NjAwIiwiZW5kcG9pbnR1cmwiOiIvZnNkMXYyWEVuZFRwcGFaWndJUk1QaEV0NXAxazNTNVBUdTNzODBiWkhzPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTIyIiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWVdFNU9UaGlaV0V0WlRNMU5TMDBPV0kwTFdJek5UWXRPR0V6TWpnNFltSTRZell4Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxtc3Nldm92MThAY29kaW5nYnVyZ2FzLmJnIiwibmlpIjoibWljcm9zb2Z0LnNoYXJlcG9pbnQiLCJpc3VzZXIiOiJ0cnVlIiwiY2FjaGVrZXkiOiIwaC5mfG1lbWJlcnNoaXB8MTAwM2JmZmRhZGZjMTFkMEBsaXZlLmNvbSIsInNlc3Npb25pZCI6IjU3YzFjYzk5LWE4YjUtNGNkZC05NmJmLWVkNmZiNmNjMjM5ZSIsInR0IjoiMCIsInVzZVBlcnNpc3RlbnRDb29raWUiOiIzIiwiaXBhZGRyIjoiODMuMjI4Ljk3LjIwMyJ9.UDkrTUVWWDdqNWlUTm5kYzB0aEd1UlJKdG1nSGZqZW9ZNGNLV2hNRFlVQT0&cTag=%22c%3A%7BC6698F15-49D2-41B4-ADCA-654390C1CDAE%7D%2C1%22&encodeFailures=1&width=1920&height=888&srcWidth=&srcHeight=)
![Model side view](https://westeurope1-mediap.svc.ms/transform/thumbnail?provider=spo&inputFormat=jpg&cs=fFNQTw&docid=https%3A%2F%2Fcodingburgas-my.sharepoint.com%3A443%2F_api%2Fv2.0%2Fdrives%2Fb!6ouZqlXjtEmzVooyiLuMYcYcu13Xcl1On2YH6zAs1H72XTBZjjZmS4Qaeikg85b1%2Fitems%2F01WFUEKFLFEWPJPDKTDNAKNHXS23BL4J5A%3Fversion%3DPublished&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvY29kaW5nYnVyZ2FzLW15LnNoYXJlcG9pbnQuY29tQDVlNmNmZDRiLTEyZDMtNGJhNC04ZWE5LTE5ZGIxOTVhYmRhNCIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE2NDg1NjYwMDAiLCJleHAiOiIxNjQ4NTg3NjAwIiwiZW5kcG9pbnR1cmwiOiIvZnNkMXYyWEVuZFRwcGFaWndJUk1QaEV0NXAxazNTNVBUdTNzODBiWkhzPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTIyIiwiaXNsb29wYmFjayI6IlRydWUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiWVdFNU9UaGlaV0V0WlRNMU5TMDBPV0kwTFdJek5UWXRPR0V6TWpnNFltSTRZell4Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsIm5hbWVpZCI6IjAjLmZ8bWVtYmVyc2hpcHxtc3Nldm92MThAY29kaW5nYnVyZ2FzLmJnIiwibmlpIjoibWljcm9zb2Z0LnNoYXJlcG9pbnQiLCJpc3VzZXIiOiJ0cnVlIiwiY2FjaGVrZXkiOiIwaC5mfG1lbWJlcnNoaXB8MTAwM2JmZmRhZGZjMTFkMEBsaXZlLmNvbSIsInNlc3Npb25pZCI6IjU3YzFjYzk5LWE4YjUtNGNkZC05NmJmLWVkNmZiNmNjMjM5ZSIsInR0IjoiMCIsInVzZVBlcnNpc3RlbnRDb29raWUiOiIzIiwiaXBhZGRyIjoiODMuMjI4Ljk3LjIwMyJ9.UDkrTUVWWDdqNWlUTm5kYzB0aEd1UlJKdG1nSGZqZW9ZNGNLV2hNRFlVQT0&cTag=%22c%3A%7B979E2565-538D-401B-A69E-F2D6C2BE27A0%7D%2C1%22&encodeFailures=1&width=1920&height=888&srcWidth=&srcHeight=)


## Technologies
***
A list of technologies used within the project:
* C# .NET 5.0
* C# WPF
* Angular
* Arduino/ESP
* XAMPP Server
* SQL 


## Installation
***
Text bellow is boilerplate

A little intro about the installation. 
```
$ git clone https://example.com
$ cd ../path/to/the/file
$ npm install
$ npm start
```
Side information: To use the application in a special environment use ```lorem ipsum``` to start


## Collaboration
***
Text bellow is boilerplate

Give instructions on how to collaborate with your project.
> Maybe you want to write a quote in this part. 
> Should it encompass several lines?
> This is how you do it.


## FAQs
***
Text bellow is boilerplate

A list of frequently asked questions
1. **This is a question in bold**
Answer to the first question with _italic words_. 
2. __Second question in bold__ 
To answer this question, we use an unordered list:
* First point
* Second Point
* Third point
3. **Third question in bold**
Answer to the third question with *italic words*.
4. **Fourth question in bold**
| Headline 1 in the tablehead | Headline 2 in the tablehead | Headline 3 in the tablehead |
|:--------------|:-------------:|--------------:|
| text-align left | text-align center | text-align right |