require 'order_management'

describe OrderManagement do

  subject(:order_management) { described_class.new }
  let(:menu) { double :menu }

  it 'should respond to #order_by_commandline' do
    expect(order_management).to respond_to(:order_by_commandline).with(2).arguments
  end

  describe '#order_by_commandline' do

    it 'should raise an error if user orders a dish that is not on the menu' do
      menu = Menu.new
      array_of_hashes = [{ name: "Spaghetti carbonara", price: 8 }, { name: "Spaghetti arabiata", price: 7 }, { name: "Lasagna al forno", price: 9 }, { name: "Pizza Margherita", price: 7 }, { name: "Pizza Quattro Stagioni", price: 10 }]
      menu.bulk_add(array_of_hashes)
      order_hash = { basket: [{ name: "Pizza Tonno", quantity: 2 }], total: 14 }
      expect { order_management.order_by_commandline(order_hash, menu.items) }.to raise_error("Sorry, 'Pizza Tonno' is not on our menu")
    end

    it 'should raise an error if user orders and enters a total that is not the calculated total' do
      menu = Menu.new
      array_of_hashes = [{ name: "Spaghetti carbonara", price: 8 }, { name: "Spaghetti arabiata", price: 7 }, { name: "Lasagna al forno", price: 9 }, { name: "Pizza Margherita", price: 7 }, { name: "Pizza Quattro Stagioni", price: 10 }]
      menu.bulk_add(array_of_hashes)
      order_hash = { basket: [{ name: "Lasagna al forno", quantity: 2 }], total: 14 }
      expect { order_management.order_by_commandline(order_hash, menu.items) }.to raise_error("Sorry, your total was incorrect. Order was not placed")
    end

  end

end
