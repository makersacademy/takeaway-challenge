# Takeaway Challenge
[![Build Status](https://travis-ci.org/lsewilson/takeaway-challenge.svg?branch=master)](https://travis-ci.org/lsewilson/takeaway-challenge)


## Description

This program is a simulation of a restaurant takeaway system, where the user can order food from a specified menu and expect to receive the correct charge for the food.

## Instructions



## Classes

There are two classes used in this program.

1. Takeaway
2. Menu

### 1. Takeaway

* Properties

  * `menu` the menu that is initialized with the takeaway.
  * `basket` all the items selected in the order
  * `total` the total cost of the items in the order

* Methods

  * `view_menu` allows the user to view formatted menu
  * `add_to_order` allows the user to add items to their basket
  * `calculate_total` calculates the total cost of all order selections in the basket

### 2. Menu

* Properties

  * `menu` a hash of all menu items and their prices

* Methods

  * `check_menu` raises an error if the user tries to add an invalid item to their basket
  * `price` returns the price of a menu item 

## Feature Test
