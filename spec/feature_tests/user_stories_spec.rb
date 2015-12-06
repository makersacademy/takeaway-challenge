require 'takeaway'

describe "User stories" do

let(:takeaway) {Takeaway.new}
let(:menu) {"starter : 5\nmains : 10\ndesert : 3\n"}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  describe 'User Story 1' do

    it 'allows a customer to see a list of dishes with prices' do
      expect{takeaway.show_dishes}.to output(menu).to_stdout
    end

  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe 'User Story 2' do

    it 'allows a customer to place an order' do
      expect{takeaway.order("starter", 1, "mains", 2, "desert", 3, 34)}.not_to raise_error
    end

    it 'prevents a customer from ordering unavailable dishes' do
      expect{takeaway.order("steak", 1, "mains", 2, "desert", 3, 34)}.to raise_error "Unable to place order: dish not on menu"
    end
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  describe 'User Story 3' do

    it 'raises an error if the customer supplied total does not match the actual total' do
      expect{takeaway.order("starter", 1, "mains", 2, "desert", 3, 666)}.to raise_error "Unable to place order: supplied total doesn't match actual total"
    end

  end
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  describe 'User Story 4' do

    it 'sends a text message to confirm a succesful order' do
      takeaway.order("starter", 1, "mains", 2, "desert", 3, 34)
      expect(takeaway.text.message).not_to eq nil
    end

  end





end
