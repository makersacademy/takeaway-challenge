require './lib/menu'

describe Menu do
  subject(:menu) { Menu.new }

  it 'will list menu items' do
    expect(menu.list_items).to include([:burger, 5], [:pizza, 10], [:fries, 2], [:salad, 3])
  end

  it 'will allow a customer to order items' do
    expect(menu).to respond_to(:order_items)
  end

  it ' #@items will store an order' do
    expect(@item).to eq(nil)
  end

  context('after a customer has placed an order')
  it 'will print an order' do
    expect { menu.order_items }.to output(@item).to_stdout
  end
end

#   context('when a customer wants to know the order total') do
#     let(:sum) {double}
#     before(:each) do
#     sum = 0
#     @total.each do |i| (sum += i)
#   end
#
#   it 'will print the order total' do
#     expect(menu.order_total).to output("Your order total is #{sum} pounds").to_stdout
#   end
# end
