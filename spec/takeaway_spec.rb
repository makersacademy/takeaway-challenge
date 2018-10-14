require 'takeaway'
require 'pry'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double :menu, list_menu: "Lists menu", items: { "Pizza" => 7.00 }, get_price: 7.00 }
  let(:order) { double :order }
  let(:text) { double :text }

  it 'prints a menu' do
    expect(takeaway.print_menu).to eq menu.list_menu
  end

  it 'raises an error if selected item is not on menu' do
    expect { takeaway.add_to_order("Octopus") }.to raise_error "Item not on menu!"
  end

  it 'adds order to order_summary' do
    allow(menu.items).to receive(:has_key?).and_return(true)
    allow(order).to receive(:add_to_basket).with("Pizza", 1)
    allow(order).to receive(:add_to_total).with(7.00, 1)
    allow(order).to receive(:order_summary).and_return("A Summary...")
    takeaway.add_to_order("Pizza", 1)
    expect(takeaway.order_summary).to eq order.order_summary
  end

  it 'adds order' do
    allow(menu.items).to receive(:has_key?).and_return(true)
    expect(order).to receive(:add_to_basket).with("Pizza", 1)
    expect(order).to receive(:add_to_total).with(7.00, 1)
    takeaway.add_to_order("Pizza", 1)
  end

  it 'adds order to basket' do
    allow(menu.items).to receive(:has_key?).and_return(true)
    allow(order).to receive(:add_to_basket).with("Pizza", 2)
    allow(order).to receive(:add_to_total).with(7.00, 2)
    allow(order).to receive(:basket).and_return({ :item => "Pizza", :quantity => 2 })
    takeaway.add_to_order("Pizza", 2)
    expect(takeaway.basket).to eq({ :item => "Pizza", :quantity => 2 })
  end

  it 'adds the price of each item to the order total' do
    allow(menu.items).to receive(:has_key?).and_return(true)
    allow(order).to receive(:add_to_basket).with("Pizza", 1)
    allow(order).to receive(:add_to_total).with(7.00, 1)
    allow(order).to receive(:total).and_return(7.00)
    takeaway.add_to_order("Pizza", 1)
    expect(takeaway.total).to eq(7.00)
  end

  it 'raises an error when incorrect sum is given' do
    allow(order).to receive(:total).and_return(100)
    expect { takeaway.place_order(10) }.to raise_error "Incorrect sum given"
  end

  it 'sends an order confirmation via text when correct sum is given' do
    allow(order).to receive(:total).and_return(100)
    expect(text).to receive(:send_sms)
    takeaway.place_order(100)
  end

end
