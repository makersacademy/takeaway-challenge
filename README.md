# Takeaway Challenge #

The client request to have a software to be able to make a user order some meal which will be delivered to his place later on.<br/>
The user have to be able to see the menu with the dish name and price, and to select the wanted amount of the desired dishes.<br/>
The user may be able to see the total of his order.<br/>
The user may receive a text to let him know that his order have been placed and will be delivered in less that an hour from the moment finalised the order.<br/>

Based on the user story, I have decided to create 5 classes and 1 module :<br/>

1. The class menu, which is the menu itself containing an array of hashes with the different dish available and their price.<br/>

2. The class order, where the user will be able to select the dishes wanted and their quantity.<br/>
This will be done until the user do not want to select any more item.<br/>
Afterward the basket will be created.<br/>

3. The class summary which will make the total of the basket of the user, and show him a summary of his order.<br/>

4. The class text which is responsible for sending a text to the user when he is finalising his order.<br/>

5. Finally, I have created a file where all the previous classes are required. And I have created a general module called takeaway interface, which is wrapping the takeway class.<br/>
This is the interface that the user will use.<br/>
This class will display the menu, call the order (select item, quantity, until confirm order), show the total, and send a text to the user.<br/>

The tests for the order class are not passing at all as I struggled to stub the user input(I wrongly build the code after the feature test but before the spec), and the tests for the text class are not build at all as for this one I construct the class first (by looking at Twilio) and had not the time to search how to test it.

I send a request to Twilio API to implement the text message.
The text is not really sent as it is not a free service.<br/>

## How to use ##

1. clone the repo<br/>
Under the repo name click *clone or download*<br/>
Click on *use HTTPs*, copy the clone URL of the repo<br/>
In the terminal go on the working directory where you want the cloned directory to be<br/>
Use the `git clone` command and paste the clone URL then press enter :

```shell
$ git clone https://github.com/your-username/your-repositary.git
```

2. On your local machine go inside of the *takeaway_challenge* directory :

```shell
$ cd airport_challenge
```
3. To install all the *gems* contained in the *Gemfile*, intall and run *Bundle* :
Install :

```shell
$ install bundle
```
Run:

```shell
$ bundle
```

4. You can see the differents directories, with the `ls` command. If you want to see all the *.rb* files built for the challenge, go inside of the *lib* directory :

```shell
$ cd lib
```
Or if you want to see all the tests built for all the code, go inside of the *sepc* directory :

```shell
$ cd lib
```

5. You can open the *.rb* file that you wanted to read and change the code in your text editor or using `vim` :

```shell
$ vim wanted_file.rb
```
Or you can just read the contains of it from the command line with `cat` :

```shell
$ cat wanted_file.rb
```
6. Check that the codes are passing the tests by going back to the root *takeaway_challenge* directory and by running the *spec*.<br/>
You can check all the code files in one time :

```shell
$ cd takeaway_challenge
$ rspec
```
You can check only one code file at a time :

```shell
$ cd takeaway_challenge
$ rspec spec/file_name_spec.rb
```

7. Check that the code respect the quality of the *Rubocop* guideline, by running `rubocop` from the *takeaway_challenge* directory :

```shell
$ cd takeaway_challenge
$ rubocop
```
