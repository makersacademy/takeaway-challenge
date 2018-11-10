require 'order'

describe Order do

  subject(:order) { described_class.new }

  # describe '#initialize' do
  #   it 'accepts a menu as an argument' do
  #     expect(order).to respond_to(:initialize).with(1).z
  #   end
  # end

  # it 'allows me to select items from the menu' do
  #   menu = double(:menu)
  #   allow(order).to receive(:menu).and_return({      'chicken korma' => 5.70,
  #   'chicken bhuna' => 6.70,
  #   'lamb rogan josh' => 6.50})
  #   order.select('chicken korma')
  #   order.select('chicken bhuna')
  #   order.select('lamb rogan josh')
  #   expect(order.selection).to eq section = {
  #     'chicken korma' => 5.70,
  #     'chicken bhuna' => 6.70,
  #     'lamb rogan josh' => 6.50
  #   }
  # end
end
