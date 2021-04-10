## Domain Model

### User stories
> 1. As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
>
> 2. As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
>
> 3. As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
>
> 4. As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
>



| Nouns                        | Property or Ower of Property?  |
| ---------------------------- | ------------------------------ | 
| Menu/Dishes                  | Owner                          | 
| Prices                       | property                       | 
| Order                        | Owner                          | 


| Actions                           | Owend by?      |
| --------------------------------- | -------------- | 
| list of dishes                    | menu           | 
| select number of available dishes | order          | 
| total matches sum of order        | order          | 
| text after ordered                | order          | 


| Actions                           | Property it reads or changes    |
| --------------------------------- | --------------------------------| 
| list of dishes                    | @dish, show_menu                | 
| select number of avaible dishes   | @dish, add_to_basket, show_menu | 
| total matches sum of order        | basket, @dish, @total,checkout, | 
| receive text after ordered        | @time, text_confirmation        |


| Class                         | Menu      | 
| ------------------------------| --------- | 
| Properties(instance variables)| @dish     | 
| Actions(methods)              | show_menu | 

 
| Class                             | Order                                              | 
| --------------------------------- | ---------------------------------------            |
| Properties(instance variables)    | @total, @time                                      | 
| Actions(methods)                  | basket, text_confirmation, add_to_basket, checkout | 
