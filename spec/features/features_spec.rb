require 'takeaway'
require 'menu'
describe 'feature tests' do
  describe Takeaway do

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices

    it 'allows a customer to view the available dishes with prices' do
      m = Menu.new
      t = Takeaway.new(m)
      expect(t.show_menu).to include("Spam")
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes

  it 'allows a customer to select from the available dishes' do
    m = Menu.new
    t = Takeaway.new(m)
    t.order("Spam")
    expect(t.current_order).to include("Spam")
  end
end
  end
