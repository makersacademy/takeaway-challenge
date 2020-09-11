# Nouns
- Customer
- Dishes w/ prices
- Meal (made up of several dishes)
- Order (of a meal)
- Text
- Time (tbc...)


# Verbs
- See list of dishes & prices
- Order a meal
  - Select dishes to make up the order
- Check total of dishes == sum of dishes in order
- Receive a text

# Classes (plan)
###Restraunt
- initialize
  - menu array (as below)

- place order
  - view menu
  - create new order object
    - input what you want
  - total_correct?
  - return list of what you want & total (new class variable in attr_reader, accesible to Text class)
  - new text

- list of dishes w/prices (menu? stored as a [name => price, name => price].
  - Puts out each with a number. User selects number & quantity for order.
    - creates x new objects of the dish selected.
    - sums the total of dishes selected and returns to user 

- delivery_text
  - initializes a new 'text' object etc

- private
- total_correct?
  - total of list of dishes given == sum of the dishes
  - Return boolean

###order
- initialize with blank array, to be filled with hashes of food
- calculate total cost

###Text (?)
Constant: Phone_number (hidden in a different file?)