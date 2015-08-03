---NOTES ON THE DOMAIN -----

Customers request menus. Then check their totals against a number provided them by the system (this user story we find slightly odd). It was decided that the computer calculated total would be accomplished within the customer class, rather than the Order class, obviating the need for a call from Order to Menu. Order's only purpose is to complete the order...in this case send confirmation, but future iterations could see the order class communicate with a kitchen class for example.

----------------

CLASSES

MENU - Simply instantiates menu objects, which contain hashes of dishes and their prices. [methods:#menu_items]

CUSTOMER - Purpose of this class is to choose dishes, and order them. Includes a number of methods. Starred methods have material dependencies whose managment are discussed below:

  #request* - a customer object can request a menu be created. While Menu objects are hard coded with their menu items, the menu class is more akin to a restaurant class, and future improvements could see the customer asking for many lists of menu items from multiple restautarnts. What's important is that the objects have a menu_items method. Any object with such a method can be exposed (injected) to customer through the #menu.
  
  #total_estimate - captures customer's estimate of his/her total bill

  #choices - captures customer's choices.

  #real_total - calculates actual total implied by customers choices. Note that the prices of dishes are retreived using a menu method where instances of menu have injected their menu items.

  #validate_order? - compares real_total to total_estimate

  #create_order* - if validate_orders comes back true, then customers can instanitate order objects by passing them order information (choices and phone number). Note the object being created is not a specific class, but any class for whom order information and a custoemr phone number are sufficient to instantiate new objects. 

  #menu - stores the menu_items retrieved by #request. #menu makes whatever menu_items have been retrieved available for use within customer. 

ORDER - Not yet fully tested. Order instances are created by customers with valid orders. This dependency is somewhat justified; orders only exist if customers decide as such. However, order instances can be created by any customers that have order_information and a phone number (i.e. uniquely identifying information). As such the order class could be used by different customer classes as long as appropriate information (methods) are available. The Order class can be further decoupled by reducing variables that are set at initialization (i.e. not all orders will include telephone confirmation). 
