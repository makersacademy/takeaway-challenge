### THOMAS IKIMI

# WEEK 1 - Takeaway Challenge

To build an interactive menu and confirmation program.

## Getting Started

I only uploaded my Menu.rb file as I was unable to get the tests to work in my spec files and thus parsing out the code into separate classes was difficult. The program runs perfectly with interactive prompts, current order checks, checkout basket and text confirmation.

Note I disabled the text and removed my number. I left a stand in puts response to confirm order.

### Prerequisites

I sent in a pull request with only the functioning program.

## Running the tests

I made a mistake in building my entire program around gets prompts and responses. I found it incredibly difficult to run unit tests on the functionality for this reason. I tried initially but after taking many hours trying to work out tests with gets I then decided that if I was to finish the challenge then I had to feature test as my method to completion.

I didn't realise we could have done this with variables as I assumed it was meant to run in realtime with real human interfacing. I relied heavily on feature testing in IRB and that is how I managed to complete the challenge albeit without RSPEC.

### REFLECTION

I really wasn't happy that I couldn't get my tests to work and that I was forced to encompass the program in a single file. I had hoped to get it into two or three classes but it was tough with the time available and the fact I'd gone the difficult route of using gets commands throughout my program. I ended up with a fully working solution that fulfilled all criteria except the bonus and I added in other functionality like current order checks and a checkout basket that clears out once you have finished your order.

```
1. Not using gets!
2. Isolating responsibilities which would have been easier without gets.
3. Using doubles and mocks
4. Planning more alternatives to my instinctive direction.
```

### WHAT I WOULD LIKE TO IMPROVE

I feel like this was a triumph and a failure. The program works just as I envisioned it, but I didn't anticipate the fact that I would not be able to run tests with it.

Though I was very happy with the finished product, if I had more time...

```
1. I would have redone it with variables instead of gets.
```



## Author
* **Thomas Ikimi** - *Initial work* -
