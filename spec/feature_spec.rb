require 'takeaway'

describe 'User stories' do

  #1 User Story
  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  context 'to see a menu' do
    it 'returns a list of dishes with prices ' do
    takeaway = Takeaway.new(Menu.new, Messager.new)
      expect(takeaway.display_menu).to eq ({"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 })
    end
  end

  #2 User Story
  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes
  context 'to place an order' do
    it 'adds an item to the basket' do
      takeaway = Takeaway.new(Menu.new, Messager.new)
      expect(takeaway.basket.size).to eq(0)
      takeaway.select_dishes("chips", 2)
      expect(takeaway.basket.size).to eq(1)
      expect{takeaway.select_dishes("turkey", 5)}.to raise_error ""\
      "turkey is not on the menu"
    end
  end

  #3 User Story
  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given matches the sum of the various #dishes in my order
  context 'to check the total price of my order' do
    it 'adds an item to the basket' do
      takeaway = Takeaway.new(Menu.new, Messager.new)
      takeaway.select_dishes("chips", 2)
      takeaway.select_dishes("pizza", 3)
      takeaway.check(22)
      #missing failing check which should raise an error
    end
  end




end
