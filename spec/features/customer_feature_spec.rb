require 'customer'
require 'menu'
require 'order'
describe 'Customer feature test' do

  describe Customer do
    let(:texter) { double :texter, send: nil }
    let(:menu) { Menu.new }
    let(:order) { Order.new(:texter) }
    subject(:customer) { described_class.new(menu, order) }

    it 'should implement this interface' do
      expect(subject).to respond_to(:menu)
    end

    it 'should give the customer access to the available menu items' do
      menu.add_dish('Pie', 1)
      customer = described_class.new(menu, order)
      expect(customer.menu.items['Pie']).to eq 1
    end

    context 'select dishes' do
      it 'should allow the customer to choose a dish' do
        menu.add_dish(:Pie, 1)
        customer = described_class.new(menu, order)
        customer.choose(:Pie)
        result = { Pie: 1 }
        expect(customer.order_items).to eq result
      end
      it 'should allow the customer to choose >1 dish' do
        menu.add_dish(:pie, 1)
        menu.add_dish(:sausage, 2)
        menu.add_dish(:mash, 3)
        customer = described_class.new(menu, order)
        customer.choose(:pie)
        customer.choose(:mash)
        result = { pie: 1, mash: 3 }
        expect(customer.order_items).to eq result
      end
    end

    context 'place order' do
      # before do
      #   menu.add_dish(:pie, 1)
      #   menu.add_dish(:sausage, 2)
      #   menu.add_dish(:mash, 3)
      #   customer = described_class.new(menu, order)
      #   customer.choose(:pie)
      #   customer.choose(:mash)
      #   p "before #{customer.order_items}"
      # end
      it 'should raise an error if the customer places an order with the wrong total' do
        menu.add_dish(:pie, 1)
        menu.add_dish(:sausage, 2)
        menu.add_dish(:mash, 3)
        customer = described_class.new(menu, order)
        customer.choose(:pie)
        customer.choose(:mash)
        expect { customer.place_order(6) }.to raise_error("Invalid total")
      end

      it 'should send the text if the customer places an valid order' do
        menu.add_dish(:pie, 1)
        menu.add_dish(:sausage, 2)
        menu.add_dish(:mash, 3)
        texter = double("texter")
        allow(texter).to receive(:send)
        customer = described_class.new(menu, Order.new(texter))
        customer.choose(:pie)
        customer.choose(:mash)
        customer.place_order(4)
      end
    end
  end
end
