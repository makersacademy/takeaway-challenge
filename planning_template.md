# Planning - Takeaway

## User Stories

### Story

> As a customer
>
> So that I can check if I want to order something
>
> I would like to see a list of dishes with prices

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| dishes | see |
| prices | |

### Story

> As a customer
>
> So that I can order the meal I want
>
> I would like to be able to select some number of several available dishes

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| dishes | select |

Note: customer should be able to select _more than one dish_, and should only be able to select _available dishes_.

### Story

> As a customer
>
> So that I can verify that my order is correct
>
> I would like to check that the total I have been given matches the sum of the various dishes in my order

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| dishes | check |
| total | match |
| sum | |
| order |

### Story

> As a customer
>
> So that I am reassured that my order will be delivered on time
>
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| text | receive |
| | ordered |

## Class Diagram

| Class:  |
| ------- |
| __Attributes__ |
| |
| __Methods__ |
| |

## Sequence Diagram

[diagram.codes](https://playground.diagram.codes/d/sequence)

````flow
alias user="Customer"
alias menu="Menu"
alias dish="Dish"
alias price="Price"
alias order="Order"
alias order_place="Place Order"
alias text="Text"

user->menu:"look at menu"
menu->menu:"filter available dishes"
menu-->user:"display available dishes with prices"
user->order:"create new order"
user->order:"add dishes to order"
order->menu:"check each dish is actually valid/available"
menu-->order:"confirm dishes are available, return price information"
order->order:"calculate total"
order-->user:"display order details with total and sum of individual prices"
user->order_place:"place order"
order_place->text:"request text message confirming order"
text-->user:"text message"
```
