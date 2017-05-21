require 'takeaway'

describe Takeaway do
  TAKEAWAY_PRICE = { price: 10 }
  subject(:takeaway) { described_class.new }
  let(:order) { double(:order) }
  let(:menu) { double(:menu) }
  let(:menu_item) { :diavolo }

  describe '#menu delegations' do
    it 'should show the full menu by default' do
      expect(takeaway.view_menu).to include(:pizza, :pasta)
    end
  end

  describe '#order delegations' do
    before(:each) do
      allow(menu).to receive(:confirm_menu_item).and_return true
    end

    it 'should allow the user to create an order' do
      expect(takeaway.create_new_order(menu_item, TAKEAWAY_PRICE[:price])).to eq([{ menu_item => TAKEAWAY_PRICE[:price] }])
    end

    it "returns an error if current order is empty" do
      expect { takeaway.print_order }.to raise_error 'No items currently ordered'
    end

    it 'allows a user to select an item from the menu' do
      allow(takeaway).to receive(:order).and_return order
      allow(order).to receive(:current_order).and_return [{ menu_item => TAKEAWAY_PRICE[:price] }, { menu_item => TAKEAWAY_PRICE[:price] }]
      expect(takeaway.select_dish(menu_item, TAKEAWAY_PRICE[:price])).to eq order.current_order
    end

    it 'prints the full order and total price' do
      takeaway.create_new_order(menu_item, TAKEAWAY_PRICE[:price])
      expect { takeaway.print_order }.to output("\"#{menu_item} - #{TAKEAWAY_PRICE[:price]}\"\n\"Total = 10.0\"\n").to_stdout
    end
  end

  describe '#delivery delegations' do
    it 'sends a delivery message on completion of order' do
      takeaway.create_new_order(menu_item, TAKEAWAY_PRICE[:price])
      expect(takeaway.complete_order).to match("Thank you! You're order will be delivered before #{DELIVERY_TIME}")
    end
  end

end
