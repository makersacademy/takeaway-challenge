require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, order: order) }

  let(:menu) { double :menu, show: printed_menu }
  let(:order) { double :order, total: 15.50 }
  let(:printed_menu) { 'Doner Kebab £4.50' }
  let(:options) { {doner: 1, shish: 2} }

  it 'shows the takeaway menu' do
    expect(takeaway.show_menu).to eq printed_menu
  end

  it 'allows different options to be ordered' do
    expect(order).to receive(:add).twice
    takeaway.place_order(options)
  end

  it 'knows the value of the order' do
    allow(order).to receive(:add)
    total = takeaway.place_order(options)
    expect(total).to eq(15.50)
  end

  
end
