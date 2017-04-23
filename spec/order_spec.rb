require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      pepperoni:  8.50,
      margerita:  7.00,
      meat_feast:  9.00,
      garlic_bread:  2.50,
      chicken_wings:  3.00
    }
  end

    # describe '#place_order' do
    #   it 'allows the customer to place an order' do
    #     subject.place_order(:pepperoni)
    #     expect(subject.order).to include(:pepperoni)
    #   end
    # end
  end
