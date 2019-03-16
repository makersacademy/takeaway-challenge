# Takeaway Challenge
**==================**
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

The task was to build a program that displayed a menu, adds things to a basket, displays a basket,

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
e.g.
With this in the spec.rb file:
```ruby
t = TakeAway.new
t.read_menu
```
Run spec.rb from terminal and get:
```sh
saypops-mac:takeaway-challenge tomedejesus$ ruby spec/spec.rb
saypops-mac:takeaway-challenge tomedejesus$ {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
```

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
e.g.
With this in the spec.rb file:
```ruby
t = TakeAway.new
t.add_to_basket("spring roll")
t.add_to_basket("pork dumpling")
t.add_to_basket("pork dumpling")
t.add_to_basket("fu-king fried rice")
```
Run spec.rb from terminal and get:
```sh
saypops-mac:takeaway-challenge tomedejesus$ ruby spec/spec.rb
saypops-mac:takeaway-challenge tomedejesus$ spring roll added to basket
saypops-mac:takeaway-challenge tomedejesus$ pork dumpling added to basket
saypops-mac:takeaway-challenge tomedejesus$ pork dumpling added to basket
saypops-mac:takeaway-challenge tomedejesus$ fu-king fried rice added to basket
```

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
e.g.
With this in the spec.rb file:
```ruby
t = TakeAway.new
t.add_to_basket("spring roll")
t.add_to_basket("pork dumpling")
t.add_to_basket("pork dumpling")
t.add_to_basket("fu-king fried rice")
t.view_basket
```
Run spec.rb from terminal and get:
```sh
saypops-mac:takeaway-challenge tomedejesus$ ruby spec/spec.rb
saypops-mac:takeaway-challenge tomedejesus$ spring roll added to basket
saypops-mac:takeaway-challenge tomedejesus$ pork dumpling added to basket
saypops-mac:takeaway-challenge tomedejesus$ pork dumpling added to basket
saypops-mac:takeaway-challenge tomedejesus$ fu-king fried rice added to basket
saypops-mac:takeaway-challenge tomedejesus$ Your basket total is 12.96 and it contains:
1 x spring roll 0.99
2 x pork dumpling 5.98
1 x fu-king fried rice 5.99
```

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
e.g.
With this in the spec.rb file:
```ruby
t = TakeAway.new
t.add_to_basket("spring roll")
t.add_to_basket("pork dumpling")
t.add_to_basket("pork dumpling")
t.add_to_basket("fu-king fried rice")
t.checkout("your_mobile_number")
```
Run spec.rb from terminal and get:
```sh
saypops-mac:takeaway-challenge tomedejesus$ ruby spec/spec.rb
saypops-mac:takeaway-challenge tomedejesus$ spring roll added to basket
saypops-mac:takeaway-challenge tomedejesus$ pork dumpling added to basket
saypops-mac:takeaway-challenge tomedejesus$ pork dumpling added to basket
saypops-mac:takeaway-challenge tomedejesus$ fu-king fried rice added to basket
saypops-mac:takeaway-challenge tomedejesus$ Thank you for your order. A confirmation text has been sent to your_mobile_number.
```

**bonus**
```
As a customer
So that I can order my food from my phone
I would like to send orders via text message
```

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
