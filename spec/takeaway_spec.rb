require 'takeaway'

describe Takeaway do
  TAKEAWAY_PRICE = { price: 10 }
  subject(:takeaway) { described_class.new }
  let(:order) { takeaway.create_new_order(:menu_item, TAKEAWAY_PRICE[:price]) }
  let(:menu) { double(:menu) }

  it 'should show the full menu by default' do
    expect(takeaway.view_menu).to include(:pizza, :pasta)
  end

  it 'should allow the user to create an order' do
    expect(takeaway.create_new_order(:menu_item, TAKEAWAY_PRICE[:price])).to eq([{ :menu_item => TAKEAWAY_PRICE[:price] }])
  end

  it "returns an error if current order is empty" do
    expect { takeaway.print_order }.to raise_error 'No items currently ordered'
  end

  it 'allows a user to select an item from the menu' do
    expect { takeaway.select_dish(:menu_item, TAKEAWAY_PRICE[:price]) }.to change { order.length }.by 1
  end

  it 'prints the full order and total price' do
    takeaway.create_new_order(:menu_item, TAKEAWAY_PRICE[:price])
    takeaway.select_dish(:menu_item, TAKEAWAY_PRICE[:price])
    expect { takeaway.print_order }.to output("\"menu_item - 10\"\n\"menu_item - 10\"\n\"Total = 20.0\"\n").to_stdout
  end

  it 'sends a delivery message on completion of order' do
    takeaway.create_new_order(:menu_item, TAKEAWAY_PRICE[:price])
    expect(takeaway.complete_order).to match("Thank you! You're order will be delivered before #{DELIVERY_TIME}")
  end

end
