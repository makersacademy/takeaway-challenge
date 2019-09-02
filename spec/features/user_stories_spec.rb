require 'takeaway'

describe 'User stories' do
  #   User story 1:
  #   As a customer
  #   So that I can check if I want to order something
  #   I would like to see a list of dishes with prices
  describe '#show_menu' do
    it 'shows a list of dishes with prices' do
      takeaway = Takeaway.new
      expect { takeaway.show_menu }.not_to raise_error
    end
    it 'shows a list of dishes with prices' do
      takeaway = Takeaway.new
      expect(takeaway.show_menu).to eq(Takeaway::MENU)
    end
  end
  # User story 2:
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe '#place_order' do
    order = "1 fish, 1 small chips, 1 shish kebab, 1 Coke, 1 Tango"
    order_total = 20
    it 'selects some number of several available dishes' do
      takeaway = Takeaway.new
      expect { takeaway.place_order(order, order_total) }.not_to raise_error
    end
  end
  # User story 3:
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given
  # matches the sum of the various dishes in my order
  describe '#totals_equal?' do
    order = "1 fish, 1 small chips, 1 shish kebab, 1 Coke, 1 Tango"
    order_total = 20

    it 'checks that the total given matches the sum of the dishes in the order' do
      takeaway = Takeaway.new
      takeaway.place_order(order, order_total)
      # puts order
      # puts order_total
      # puts takeaway.sum_of_dishes # is giving 0
      expect(takeaway.totals_equal?).to eq(true)
    end
  end
end
