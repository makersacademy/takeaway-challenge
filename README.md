[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
======================================
Makers Academy Weekend Challenge no. 2
======================================

Simple program to place an order with a take restaurant and receive a SMS confirming the order a giving a delivery time.

============
Instructions
============

.show_menu -
Lists menu items and prices

.add_to_basket(item, qty) -
Adds items to basket, if qty is missing it will default to 1. If item is not on the menu an error will be raised.

.total -
Shows total value of basket

.place_order(payment) -
Places order, an SMS will be sent confirming the order and giving a delivery time. If payment is incorrect and error will be raised.
