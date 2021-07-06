require 'takeaway'

RSpec.describe Takeaway do 

  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:dishes) { {pizza: 2, fish: 1} }

  let(:menu) { double(:menu, print_dishes: printed_menu) }
  let(:order) { double(:order, total: 15.50)}
  let(:printed_menu) { "Pizza £5.50, Fish £6.75" }

  it 'has a list of dishes and prices' do 
    expect(menu.print_dishes).to eq printed_menu
  end

  it 'can order some number of available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do 
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

end