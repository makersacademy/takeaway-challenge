README::::takeaway_challenge

Author:::: Michael Lo, Makers May cohort 2016

Files

lib
- calculator.rb    : calculator class - responsibility: to perform calculations
- checkout.rb      : checkout class - responsibility: to confirm the order
- menu.rb          : menu class  - responsibility: to store and show the menu
- order.rb         : order class - responsibility: to process orders
- texter.rb        : texter class - to send a text

spec            : respective tests
- calculator_spec.rb
- checkout_spec.rb
- menu_spec.rb
- order_spec.rb
- texter_spec.rb
- feature_spec.rb

Installation instructions
- install the bundler gem and run bundle install
- run from the root directory to run the tests
- interact with the program by running irb and require './lib/menu'

::Approach

I wanted the order process to be simple, ideally creating one instance of an order and having various ways
to process the order. This has led designing public methods from the order class to call on methods from other classes.
Here's an example in irb:

Michaels-MacBook-Pro:takeaway-challenge MichaelLo$ irb
require './lib/menu'
 => true

menu = Menu.new.show
 => {"chips"=>1, "oreo"=>3, "cake"=>2}

order = Order.new('cake')
 => #<Order:0x007f902ba481f8 @menu=#<Menu:0x007f902ba48158 @menu={"chips"=>1, "oreo"=>3, "cake"=>2}>, @order={"cake"=>1}>

order.add('oreo',5)
 => 5

order.view
 => {"cake"=>1, "oreo"=>5}

order.deduct('oreo')
 => 4

order.view
 => {"cake"=>1, "oreo"=>4}

order.place
"*****'---------------'******"
"****'                  '****"
"**'                      '**"
"*'                        '*"
"*        Your Order        *"
"*'========================'*"
"*     Item     Quantity   . *"
"*'========================'*"
".       cake      1        ."
".       oreo      4        ."
"*'========================'*"
"       Order Total: £14      "
"*'                        '*"
"**'                      '**"
"******'---------------'*****"
 => "******'---------------'*****"

order.confirm
"Your text confirmation is on it's way!"
"Your confirmation should be along shortly!"
 => "Your confirmation should be along shortly!"
