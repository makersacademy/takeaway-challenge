# Takeaway Challenge

This repository contains programming concerning the Makers Week 02 weekend development project "Takeaway Challenge". This file documents the process of designing, coding and testing this project. This process will use the TDD process, divided into several steps. These steps are:

1. [ ] Setting up the development environment.
2. [ ] Identifying User Stories, and sorting them into Objects and their Instance Variables, and the Messages to be sent between them.
3. [ ] Identifying Features
4. [ ] Creating individual files for each Class.
5. [ ] Creating individual RSpec files for each Class.
6. [ ] Write RSpec Unit tests for each individual feature.

##  1.  Setting Up the Development Environment:

This program will be developed using TDD, and requires access to the Twilio API. Steps completed are as follows:

  [x] Register for a Twilio account.
  [x] Verify my phone number.
  [x] Add Twilio Gem to the Gemfile.

It is extremely important not to push private personal data (e.g. my personal phone number or Twilio API key) to publicly-accessible resources like GitHub.

  [ ] Secure these variables.

##  2.  User Stories, Objects, Attributes & Messages:

The operative parts of the supplied User Stories are:

```
I would like to see a list of dishes with prices

I would like to be able to select some number of several available dishes

I would like to check that the total I have been given matches the sum of the various dishes in my order

I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
These can be preliminarily sorted into some objects, and their variables.

*  `Menu`
  * `@menu`
*  `MenuItem`
  * `@menu_item_name`
  * `@menu_item_price`
  * `@menu_item_category`
* `Order`
  * `@basket`
* `Basket`
  * `@contents`
* `Twilio`
  * `@contact_number`

The preliminary messages between these objects might include:

* `#start_order`
* `#acquire_details`
* `#show_menu`
* `#add_to_basket`
* `#show_basket`
* `#remove_from_basket`
* `#checkout`
* `#place_order`
* `#confirm_order`
* `#send_text`

Object | Messages | Variables
---|---|---
`Order` | `#start_order` `#acquire_details` `#show_basket` `#checkout` `#place_order` `#confirm_order` | `@basket` `@twilio`
`Menu` | `#show_menu` | `@menu`
`MenuItem` | `#add_to_basket` | `@menu_item_name` `@menu_item_price` `menu_item_category`
`Basket` | `#remove_from_basket` `#place_order` | `@contents`
`Twilio` | `#add_contact_number` `#send_text` | `@contact_number`

##  3.  Identifying Features:

There are four specific features listed, and one implied:

1.  Listing the menu.
2.  Choosing from the menu to create an order.
3.  Checking that order total matches the chosen items' individual prices.
4.  Placing the order.
5.  Receiving a confirmatory text after placing the order.

##  4.  Classes

Each object will require a class. In preliminary order of creation, these are:

1.  `Order`
2.  `Menu`
3.  `MenuItem`
4.  `Twilio`

##  5.  Feature Testing

The feature/unit testing cyle will proceed for each of the features listed in step 3.

##  6.  Unit testing
