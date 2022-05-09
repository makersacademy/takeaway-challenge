require 'takeaway'
describe Takeaway do
subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }
let(:menu) { double(:menu, print: printed_menu) }
let(:order) { instance_double("Order", total: 15) }
let(:sms) { instance_double("SMS", deliver: nil)}
let(:printed_menu) { "Menu List" }

let(:dishes) { {chicken: 3, steak: 2, veg: 4} }

  before do
    allow(order).to receive(:add)
  end 

  it 'shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'select some number of several avaliable dishes' do
    expect(order).to receive(:add).thrice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do
    total = takeaway.place_order(dishes)
    expect(total).to eq(15)
  end

  it 'sends a text message when the order is placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
