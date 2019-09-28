require 'takeaway'

describe Takeaway do
  let(:dish1) { double("Dish1", name: "Copius Fried Wild Greens", cost: 3) }
  let(:dish2) { double("Dish2", name: "Spicy Sauteed Peppers", cost: 3) }
  let(:dish3) { double("Dish3", name: "Copius Mushroom Skewers", cost: 5) }
  let(:dish4) { double("Dish4", name: "Vegetable Omlette", cost: 6) }
  let(:dish5) { double("Dish5", name: "Fried Egg and Rice", cost: 5) }
  let(:dish6) { double("Dish6", name: "Monster Curry", cost: 6) }
  let(:dish7) { double("Dish7", name: "Mushroom Risotto", cost: 5) }
  let(:dish8) { double("Dish8", name: "Creamy Heart Soup", cost: 8) }  

  let(:order) { double("Order", add: nil) }
  let(:order_class) { double("OrderClass", new: order) }
  
  subject(:takeaway) { 
    dishes = [dish1, dish2, dish3, dish4, dish5, dish6, dish7, dish8]
    Takeaway.new(dishes: dishes, order_class: order_class) 
  }
  messages = [
    "Welcome to Link's Wild Delivery!",
    "Here's the menu, please enter which items you'd like:",
    "1.  Copius Fried Wild Greens       💎  3",
    "2.  Spicy Sauteed Peppers          💎  3",
    "3.  Copius Mushroom Skewers        💎  5",
    "4.  Vegetable Omlette              💎  6",
    "5.  Fried Egg and Rice             💎  5",
    "6.  Monster Curry                  💎  6",
    "7.  Mushroom Risotto               💎  5",
    "8.  Creamy Heart Soup              💎  8",
  ]

  it 'accepts a list of dishes when instantiated' do
    expect(described_class.new(dishes: [dish1, dish2], order_class: order_class))
  end

  it 'creates an order when instantiated' do
    expect(order_class).to receive(:new)
    described_class.new(dishes: [dish1], order_class: order_class)
  end

  describe '#run' do
    it 'prints the welcome screen and menu' do
      messages.each { |message| expect(STDOUT).to receive(:puts).with(message) }
      allow(STDOUT).to receive(:puts).with(any_args)
      allow(takeaway).to receive(:gets).and_return("")
      takeaway.run
    end
    it 'accepts user input' do
      expect(takeaway).to receive(:gets).and_return("")
      takeaway.run
    end
    it 'prints a message after selection' do
      allow(takeaway).to receive(:gets).and_return("")
      messages.each { |message| expect(STDOUT).to receive(:puts).with(message) }
      expect(STDOUT).to receive(:puts).with("Added to order.")
      expect(STDOUT).to receive(:puts).with("Anything else? Enter to finish adding items.")
      takeaway.run
    end
    context 'when given a valid selection' do
      it 'forwards selection to order to be added' do
        allow(takeaway).to receive(:gets).and_return("1")
        allow(STDOUT).to receive(:puts).with(any_args)
        expect(order).to receive(:add).with(dish1)
        takeaway.run
      end
    end
  end
end