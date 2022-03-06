require "dishes"

describe Dishes do

  # Lets create 5 Dish objects
  cheeseburger = Dish.new("Cheeseburger Meal", 5)
  fish_burger = Dish.new("Fillet O Fish", 7)
  mcflurry = Dish.new("McFlurry", 1)
  fries = Dish.new("Fries", 2)
  coke = Dish.new("Large Coke", 3)

  # Now lets create a menu to use in our tests
  mcdonalds_menu = Dishes.new([cheeseburger, fish_burger, mcflurry, fries, coke])

  it "should take an argument of Dish objects" do
    expect{Dishes.new(cheeseburger)}.not_to raise_error
  end

  it "should produce an empty array when no Dish objects are given" do
    expect(subject.list).to eq([])
  end 

  it "should save all 5 dish objects in the list array" do
    expect(mcdonalds_menu.list.length).to eq (5)
  end

  describe "#see_dishes" do
    it "should not raise an error when called" do
      expect{subject.see_dishes}.not_to raise_error
    end

    it "should print out the dish objects with the name followed by a price" do
      small_menu = Dishes.new([cheeseburger])

      expect do
        small_menu.see_dishes
      end.to output("#{cheeseburger.name}  £#{cheeseburger.price}\n").to_stdout
    end
  end


end