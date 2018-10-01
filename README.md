# Takeaway Challenge

## Installation

Simply clone this repo using your terminal of choice, then use your prefered IDE or text editor to edit/ run individual files. Following this ensure your version of ruby matches that found in the Gemfile, then install any gems missing on your machine.

### Dependancies

* ruby v 2.5.0
* rspec (for running the tests)
* bundler (for Gem installation)

## Test instructions

To run the included tests simply enter *rspec* into cmd/ terminal inside the *takeaway-challenge* directory. if successful you should see an output like so:

  ```
     Finished in 0.00111 seconds (files took 0.33824 seconds to load)
     10 examples, 0 failures  
  ```

if you get an error saying that *rspec* is not a recognised command then you need to install rspec. do this, then run the command again

## Usage

To run the application, open *Irb* or any equivilent and run the following command:

```
  irb(main):001:0> require './lib/main' ; main = Main.new; main.main
```

This will load the main class file, create a class instance and run the main method.

### Commands

```
  any number : add the item with the corresponding number to basket
  clear      : clear the current shopping basket
  order      : place an order for the items in basket and quit
  q          : quits the program without ordering
```

### Ordering
Following a placed order you should receive a text message like the one below :
```
  Your order has been dielivered and will arrive at 11:30
```

### Credits
  * Makers Academy for the origonal repo and project idea
  * Mschmidt19 - for the :gets stubbing rspec code