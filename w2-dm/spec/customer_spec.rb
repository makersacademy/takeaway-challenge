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
end