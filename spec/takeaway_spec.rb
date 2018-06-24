require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order, messenger) }
  let(:order) { double(:order) }
  let(:menu) { double(:menu, print_dishes: dishes) }
  let(:dishes) { "Margherita 10.99, Fish and Chips 11.00" }
  let(:customer_order) { { pizza: 1, pasta: 2 } }
  let(:messenger) { double(:messenger, send: nil) }

  describe '#show_menu' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.show_menu).to eq dishes
    end
  end

  describe '#place_order' do
    it 'can place an order' do
      allow(order).to receive(:add)
      takeaway.place_order(customer_order)
    end
  end

  # describe '#total' do
  #   it 'returns the payable balance' do
  #     allow(order).to receive(:add)
  #     allow(order).to receive(:total).and_return(10)
  #     takeaway.place_order(customer_order)
  #     expect(takeaway.total).to eq 10
  #   end
  # end

  describe '#basket' do
    it 'allows customers to check current order before purchase' do
      allow(order).to receive(:dish_total).and_return([6.00])
      allow(order).to receive(:basket).and_return({ pizza: 3 })
      allow(menu).to receive(:price).and_return(2.00)
      expect(takeaway.basket).to eq "Pizza 3 £6.00"
    end
  end

  describe '#checkout' do
    it 'returns the order total' do
      allow(order).to receive(:add)
      allow(order).to receive(:total).and_return(10)
      takeaway.place_order(customer_order)
      expect(takeaway.checkout).to eq 10
    end

    it 'sends a text message' do
      allow(order).to receive(:total)
      expect(messenger).to receive(:send)
      takeaway.checkout
    end
  end
end
