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
  end
end
