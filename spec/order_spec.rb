require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:meal1) { 0 }
  let(:meal2) { 1 }
  let(:error_meal) { 9 }
  let(:amount) { 1 }
  let(:user_input) { double user_input }
 
  describe "#select_food" do
 
    it "raises an error if out of bounds" do
      error_message = "This choice is outside the boundaries of time and space"
      expect(order).to receive(:gets).and_return(error_meal)
      expect{order.select_food}.to raise_error(error_message)
    end
 
    it "responds to #select_food" do
        expect(order).to respond_to(:select_food)
    end
 
    it "returns the menu selection on input" do 
      expect(order).to receive(:gets).and_return(meal1, amount)
      expect(order.select_food).to eq "You have added #{MENU[0][:food]} to the basket"
    end
  end
 
  describe "#show_bill" do
 
    it "returns a total of the food inside the basket" do
      expect(order).to receive(:gets).and_return(meal1, amount)
      order.select_food
      expect(order).to receive(:gets).and_return(meal2, amount)
      order.select_food
      order.view_order
      expect(order.show_bill).to eq "Your bill is: £17.5"
    end
  end

end
