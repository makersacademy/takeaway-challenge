# Takeaway Challenge - Solution

## About

This is my solution to the second weekend challenge. The aim of this exercise was to practice OOP and TDD by building an application with SMS functionality from the ground up. The program lets you place an order at `Rahul's Ridiculously Rancid Restaurant` via the command line and get an order confirmation by SMS.

## Current Diagram

```puml
actor client

==seeing the menu==
client -> program: menu
program --> client: {menu with prices}

==ordering==
client -> program: {item1: quantity,\nitem2: quantity,\n total: quantity}
program -> twilio_api: order confirmation
twilio_api --> client: order confirmation
```