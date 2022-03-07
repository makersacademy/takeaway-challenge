require "dishes"

describe Dishes do

  # Lets create 5 Dish objects
  cheeseburger = Dish.new("Cheeseburger Meal", 5)
  fish_burger = Dish.new("Fillet O Fish", 7)
  mcflurry = Dish.new("McFlurry", 1)
  fries = Dish.new("Fries", 2)
  coke = Dish.new("Large Coke", 3)

  # Now lets create a menu to use in our tests
  mcdonalds_menu = Dishes.new([1 => cheeseburger, 2 => fish_burger, 3 => mcflurry, 4 => fries, 5 => coke])

  # Also create a small menu with just one dish
  small_menu = Dishes.new([{1 => cheeseburger}])

  it "should take an argument of Dish objects" do
    expect{Dishes.new(cheeseburger)}.not_to raise_error
  end

  it "should produce an empty array when no Dish objects are given" do
    expect(subject.list).to eq([])
  end 

  it "should save all 5 dish objects in the list array" do
    expect(mcdonalds_menu.list[0][5]).to eq (coke)
  end

  describe "#see_dishes" do
    help_message = "Please use the numbers on the left to choose your dishes\n"

    it "should not raise an error when called" do
      expect{subject.see_dishes}.not_to raise_error
    end

    it "should print out the dish objects with the name followed by a price" do
      expect do
        small_menu.see_dishes
      end.to output("1 => #{cheeseburger.name}  £#{cheeseburger.price}\n#{help_message}").to_stdout
    end

    it "should output instructions on how to order when finished creating list of dishes" do
      expect do
        subject.see_dishes
      end.to output("#{help_message}").to_stdout
    end
  end

  describe "#select_dishes" do
    it "should not raise an error when passed an argument" do
      expect do
        mcdonalds_menu.select_dishes([1, 3, 4])
      end.not_to raise_error
    end

    it "should take an array of numbers as an argument and output the corresponding dishes" do
      expect(mcdonalds_menu.select_dishes([1, 3, 4])).to eq([cheeseburger, mcflurry, fries])
    end
  end


end