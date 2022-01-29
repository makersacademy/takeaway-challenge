# Takeaway Challenge - Solo - Abdul Mobarak

## User stories


<p style="margin: 0px">
  As a customer. So that I can check if I want to order something
</p>
<div>
  I would like to 
    <span style="color: blue">
      see a list of dishes with prices.
    </span>
</div>

<p style="margin: 0px">
  As a customer. So that I can order the meal I want.
</p>
<div>
  I would like to be able to 
    <span style="color: blue">
      select some number of several available dishes
    </span>
</div>

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


----------

### Investigating the User Stories
Take the nouns and verbs from the user stories above, and place them in the following tables to help us investigate them and see how they relate to each other.

  <div style="display: flex; justify-content: center; align-items: center; flex-direction: row; width: 1000px>

  <div style="display: inline-block; margin: 10px; font-size: 12px; max-width: 200px">

| Noun | Property / Owner of Property |
|------|------------------------------|
| list of dishes      | Owner?                  |
| prices              | Property of dishes      |
| dishes              | Owner                   |
| my order            | Owner?                  |
| sum                 | Action/method on dishes |
</div>
  <div style="display: inline-block; margin: 10px; font-size: 12px; max-width: 200px">



| Actions | Owned by |
|---------|----------|
| ordered                  |                          |
| receive text             |                          |
| check total matches sum  | Property of my order     |
| select available dishes  | Property of dishes       |
</div>
  <div style="display: inline-block; margin: 10px; font-size: 12px; max-width: 200px">



| Actions | Properties it reads or changes |
|---------|--------------------------------|
|         |                                |
|         |                                |
|         |                                |
|         |                                |
|         |                                |
|         |                                |
|         |                                |
</div>
</div>

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