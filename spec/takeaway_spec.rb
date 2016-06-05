require 'takeaway'

describe Takeaway do
    
  subject(:takeaway) { described_class.new }
  let(:meal1) { 0 }
  let(:meal2) { 1 }
  let(:error_meal) { 9 }
  let(:amount) { 1 }
  let(:user_input) { double user_input }

  describe "#view_menu" do
    it "prints out the menu on request" do
    expect(takeaway.view_menu).to eq MENU
    end

  end

  describe "#select_food" do
    
    it "raises an error if out of bounds" do
       error_message = "This choice is outside the boundaries of time and space"
       expect(takeaway).to receive(:gets).and_return(error_meal)
       expect{takeaway.select_food}.to raise_error(error_message)
    end

    it "responds to #select_food" do
        expect(takeaway).to respond_to(:select_food)
    end

    it "returns the menu selection on input" do
        expect(takeaway).to receive(:gets).and_return(meal1, amount)
        expect(takeaway.select_food).to eq "You have added #{MENU[0][:food]} to the basket"
    end
  end
  
  describe "#show_bill" do

    it "returns a total of the food inside the basket" do
        expect(takeaway).to receive(:gets).and_return(meal1, amount)
        takeaway.select_food
        expect(takeaway).to receive(:gets).and_return(meal2, amount)
        takeaway.select_food
        takeaway.view_order
        expect(takeaway.show_bill).to eq "Your bill is: £17.5"
    end
  end
end
