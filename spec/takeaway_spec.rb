require 'takeaway'

describe Takeaway do
  TAKEAWAY_PRICE = { price: 10 }
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to :view_menu }

  it 'should show the full menu by default' do
    expect(takeaway.view_menu).to include(:pizza_dishes)
  end

  it 'should allow the user to create an order' do
    expect(takeaway.create_new_order(:menu_item, TAKEAWAY_PRICE[:price])).to eq([{ :menu_item => TAKEAWAY_PRICE[:price] }])
  end

  it "returns an error if current order is empty" do
    expect { takeaway.view_current_order }.to raise_error 'No items currently ordered'
  end

  it 'allows a user to select an item from the menu' do
    takeaway.create_new_order(:menu_item, TAKEAWAY_PRICE[:price])
    expect { takeaway.select_dish(:menu_item, TAKEAWAY_PRICE[:price]) }.to change { takeaway.view_current_order.length }.by 1
  end
  
  it 'prints the full order and total price' do
    takeaway.create_new_order(:menu_item, TAKEAWAY_PRICE[:price])
    takeaway.select_dish(:menu_item, TAKEAWAY_PRICE[:price])
    expect { takeaway.print_current_order }.to output("\"menu_item - 10\"\n\"menu_item - 10\"\n").to_stdout
  end
end
