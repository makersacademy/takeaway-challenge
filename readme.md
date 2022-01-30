## Takeaway Challenge - Solo - Abdul Mobarak

Following our training session with Roi who showed us how to break down user stories and make a plan before coding; I will break down the user stories and create a flowchart, thinking about my classes, objects, methods, variables etc.

#### User stories

> ~~As a customer. So that I can~~ ***check*** ~~if I want to~~ ***order*** ~~something. I would like to~~ ***see*** ~~a list of~~ ***dishes***  ~~with~~ ***prices***.

> ~~As a customer. So that I can~~ ***order*** ~~the meal I want. I would like to be able to~~ ***select*** ~~some number of several~~ ***available dishes***

> ~~As a customer. So that I can~~ ***verify*** ~~that my order is~~ ***correct***. ~~I would like to~~ ***check*** ~~that the~~ ***total*** ~~I have been given~~ ***matches*** ~~the~~ ***sum*** ~~of the~~ ***various dishes*** ~~in my~~ ***order***.

> ~~As a customer. So that I am reassured that my order will be~~ ***delivered on time***. ~~I would like to~~ ***receive*** ~~a~~ ***text*** ~~such as "Thank you! Your order was placed and will be delivered before 18:52" after I have~~ ***ordered***.

#### Verbs and nouns list from user stories

| Verbs                 | Nouns            |
|-----------------------|------------------|
| See(list of dishes)   | List             |
| Check?                | Dishes           |
| Order                 | Prices           |
| Order?                | Available        |
| Select                | Sum              |
| Verify/correct        | Order            |
| Check total           | Text msg         |
| Matches               |                  |
| Receive               |                  |
| Ordered               |                  |


#### Investigating the User Stories
Take the nouns and verbs from the user stories above, and place them in the following tables to help us investigate them and see how they relate to each other.


| Noun                     | Property / Owner of Property |
|--------------------------|------------------------------|
| List/dishes)             | Owner?                       |  
| Prices                   | Property of dishes           |
| Available                | Property of dishes           |
| Dishes                   | Owner                        |
| My order                 | Owner and property of dishes |
| Sum                      | Action/method on dishes      |
| Text message             | Property of order            |


| Actions                   | Owned by                  |
|---------------------------|---------------------------|
| See(list of dishes)       | Dishes                    |
| Order(ed)                 | ?                         |
| Select(dishes)            |                           |
| Receive text              | Property of order         |
| Check total matches sum   | Property of order         |
| Select available dishes   | Property of dishes        |


| Actions | Properties it reads or changes |
|---------|--------------------------------|
|         |                                |
|         |                                |
|         |                                |
|         |                                |
|         |                                |
|         |                                |
|         |                                |

----------


### Class Diagrams for the User Stories
Summarise what we have learned from the previous tables to diagram our classes


| Class                           |   |
|---------------------------------|---|
| Properties (instance variables) |   |
| Actions (methods)               |   |



| Class                           |   |
|---------------------------------|---|
| Properties (instance variables) |   |
| Actions (methods)               |   |



| Class                           |   |
|---------------------------------|---|
| Properties (instance variables) |   |
| Actions (methods)               |   |



| Class                           |   |
|---------------------------------|---|
| Properties (instance variables) |   |
| Actions (methods)               |   |