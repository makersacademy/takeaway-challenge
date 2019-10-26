require 'menu'
require 'order'

RSpec.describe 'User stories' do

# Version 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'shows menu' do
    menu = Menu.new
    expect { menu.display }.to output(/Menu/).to_stdout
  end

# Version 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
  context "when creating a new order" do
    let(:order) { Order.new }
    let(:margarita) { "margarita" }
    let(:pepperoni) { "pepperoni" }

    it 'allows you to select some number of available dishes' do
      order.select(margarita)
      expect(order.basket).to eq([{ dish: margarita, quantity: 1 }])
      expect(order.total).to eq(9)

      order.select(margarita)
      expect(order.basket).to eq([{ dish: margarita, quantity: 2 }])
      expect(order.total).to eq(18)

      order.select(pepperoni, 2)
      expect(order.basket).to include({ dish: pepperoni, quantity: 2 })
      expect(order.total).to eq(38)
    end
  end

end
