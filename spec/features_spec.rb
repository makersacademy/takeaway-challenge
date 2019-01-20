require 'takeaway'
require 'menu'
require 'order'

RSpec.describe 'Feature Tests' do
  subject(:takeaway) { Takeaway.new(menu, Order.new(menu)) }
  
  let(:menu) { Menu.new(dishes) }
  let(:dishes) { { "Classic Chicken": 8.85, "Chick Chick Boom": 9.45 } }
  let(:printed_menu) { "Classic Chicken £8.85, Chick Chick Boom £9.45" }

  let(:order_spec) { { "Classic Chicken": 2, "Chick Chick Boom": 1 } }

  it 'shows a list of dishes with prices' do
    expect(takeaway.print_menu).to eq printed_menu
  end

  it 'select some number of several available dishes' do
    expect(takeaway.add_to_basket(order_spec)).to eq 'Added to Basket'
  end

  it 'sum given matches the sum of the various dishes in my order' do
    takeaway.add_to_basket(order_spec)
    expect(takeaway.total).to eq 27.15
  end
end
