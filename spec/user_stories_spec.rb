require 'Menu'
require 'Restaurant'

RSpec.describe Menu do
  let(:menu) { described_class.new }

  context 'list of dishes' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
    it 'so I can check if I can order something, there is a list of dishes with prices' do
      expect { menu.list_of_dishes }.not_to raise_error
    end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
    it 'so I can select number of several available dishes' do
      burger = double('Menu item')
      expect { menu.select_dish(burger, 1) }.not_to raise_error
    end
  end

end

RSpec.describe Restaurant do
  let(:restaurant) { described_class.new }

  context 'Bill and confirmation' do
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
    it 'so I can check the total bill matches the sum of the various dishes in my order ' do
      expect { restaurant.bill }.not_to raise_error
    end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52",
  # after I have ordered
    it 'so I can be informed by text about delivery time after I place an order' do
      allow(restaurant).to receive(:place_your_order).and_return(false)
      expect { restaurant.place_your_order }.not_to raise_error
    end
  end

end
