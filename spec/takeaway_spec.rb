require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, order: order, messenger: messenger) }

  let(:menu) { double :menu, show: printed_menu }
  let(:order) { double :order, total: 15.50 }
  let(:messenger) { double :messenger, deliver: nil }
  let(:printed_menu) { 'Doner Kebab £4.50' }
  let(:options) { {doner: 1, shish: 2} }

  before do
    allow(order).to receive(:add)
  end

  it 'shows the takeaway menu' do
    expect(takeaway.show_menu).to eq printed_menu
  end

  it 'allows different options to be ordered' do
    expect(order).to receive(:add).twice
    takeaway.place_order(options)
  end

  it 'knows the value of the order' do

    total = takeaway.place_order(options)
    expect(total).to eq(15.50)
  end

  it 'sends an SMS when the order has been placed' do
    expect(messenger).to receive(:deliver)
    takeaway.place_order(options)
  end

end
