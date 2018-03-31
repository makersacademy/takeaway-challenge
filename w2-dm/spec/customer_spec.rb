require 'app'

describe 'Customer' do

  subject(:customer) {Customer.new}
  subject(:menu) {double(
  :menu, 
  :options => {:Pizza => 10, :Chips => 5, :Fish => 12, :Salad => 9, :Burger => 9},
  )}

  describe "#show_menu" do
    it "prints the menu for the customer" do
      expect(customer.show_menu).to include(menu.options)
    end
  end

  describe "#select" do
    #requires input from the user
    it "allows the customer to select items from the menu and store them" do
      expect(customer.select).to eq customer.selected_items
    end
  end 

  describe "#show_total" do
    it "prints the total price of the order for the user" do
      expect(customer.show_total).to eq customer.total
    end
  end


end