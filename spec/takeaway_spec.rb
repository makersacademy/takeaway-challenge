require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order) }
  let(:order) { double(:order) }
  let(:menu) { double(:menu, print_dishes: dishes) }
  let(:dishes) { "Margherita 10.99, Fish and Chips 11.00" }
  let(:customer_order) { { pizza: 1, pasta: 2 } }

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

end
