require 'takeaway'
require 'menu'

  describe 'feature tests' do

    it 'allows a customer to view the available dishes with prices' do
      # As a customer
      # So that I can check if I want to order something
      # I would like to see a list of dishes with prices
      m = Menu.new
      t = Takeaway.new(m)
      expect(t.show_menu).to include("Spam")
    end

    it 'allows a customer to select from the available dishes' do
      # As a customer
      # So that I can order the meal I want
      # I would like to be able to select some number of several available dishes
      m = Menu.new
      t = Takeaway.new(m)
      t.order("Spam")
      expect(t.current_order).to include("Spam")
    end

    it 'allows a customer to view their order and total price' do
      #As a customer
      # So that I can verify that my order is correct
      # I would like to check that the total I have been given matches the sum of the various dishes in my order
      m = Menu.new
      t = Takeaway.new(m)
      t.order("Spam")
      t.order("Spam on Toast", 5)
      expect{ t.show_basket }.to change{ t.instance_variable_get(:@total) }.by 13.50
    end
  end
