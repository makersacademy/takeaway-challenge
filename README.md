# Takeaway Challenge
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

# Description

TBC

# Installation

Run `gem install bundle`

Run `bundle` to require all necessary gems

Run `ruby init.rb` to execute programme

# Example Code

[TBC]

# Development Process

1) After creating a domain model from the user stories, I have decided to start by creating 2 units: a `menu` class, and an `order` class. The user will browse the `menu` before selecting items to add to their `order` basket. The user can check their order and total by viewing basket and if they confirm their `order`, they will receive a text message to confirm the delivery time of their `order`.

2) After initial creation of `Order` and `Menu`, I realised that another file would be needed to interact with the user so that they can select items from the menu. Allowing the user experience to build on my domain model should help structure the incremental development.

3) I then realised that a `Restaurant` file would be needed to create instances of `Menu` and `Order` and be the primary file that interacts with the user. This would be the optimum solution from an object-oriented approach.

# Author

Terence Allitt
