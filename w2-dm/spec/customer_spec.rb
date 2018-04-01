require 'app'

describe 'Customer' do

  subject(:customer) {Customer.new}
  subject(:menu) {double( :menu, :options => {:Pizza => 10, :Chips => 5, :Fish => 12, :Salad => 9, :Burger => 9},)}

  describe "#show_menu" do
    it "prints the menu for the customer" do
      expect(customer.show_menu).to include(menu.options)
    end
  end

  describe "#select" do
    #requires input from the user
    it "allows the customer to select items from the menu and store them" do
      expect(customer.select(20)).to eq customer.selected_items
    end
  end 

  describe "#show_total" do
    it "raises an error is the user enters amount that's not equal to total" do
      customer.stub(:total) {100}
      customer.stub(:user_cost) {50}
      expect {customer.show_total}.to raise_error "Incorrect amount stated" 
    end

    it "prints the total price of the order for the user" do
      customer.stub(:user_cost) {45}
      customer.stub(:total) {45}
      expect(customer.user_cost).to eq customer.total
    end 
  end

  describe "#confirm_order" do
    it "raises an error if the correct price is not entered" do
      customer.stub(:total) {0}
      expect{customer.confirm_order}. to raise_error "Correct and complete your order"
    end
  end

end