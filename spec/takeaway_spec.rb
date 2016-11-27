require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu, sms, order) }
  let(:klass1) { double(:klass1) }
  let(:klass2) { double(:klass2) }
  let(:klass3) { double(:klass3) }
  let(:menu) { double(:menu) }
  let(:sms) { double(:sms) }
  let(:order) { double(:order) }
  let(:item) { double(:item) }
  let(:qty) { double(:qty) }

  before do
    allow(menu).to receive(:new).and_return menu
    allow(sms).to receive(:new).and_return sms
    allow(order).to receive(:new).and_return order
    allow(order).to receive(:new).and_return order
    allow(menu).to receive(:menu_list).and_return ({"Spag_Bol" => 6.5, "Pizza" => 4, "Chips" => 2.75})
    allow(sms).to receive(:send_sms)
  end

  context 'Initialization' do

    it 'accepts a Menu object on initialization' do
      expect(takeaway.menu).to eq menu
    end

    it 'accepts a Message Type object on initalization' do
      expect(takeaway.message_type).to eq sms
    end

  end

  context 'View Order' do

    it 'allows a user to read from the menu' do
      allow(menu).to receive(:view_menu).and_return ({"Spag_Bol" => 6.5, "Pizza" => 4, "Chips" => 2.75})
      expect(takeaway.read_menu).not_to be nil
    end

  end

  context 'Create Order' do

    it 'can create a new order' do
      takeaway.create_order
      expect(takeaway.order).to eq order
    end

  end

  context 'Selection' do

    it 'returns "Not a valid item" when passed "Peas"' do
      allow(menu).to receive(:in_menu?).and_return false
      expect(takeaway.select_item("Peas")).to eq "Not a valid item"
    end

  end

  context 'Confirm Order' do

    before(:each) do
      allow(takeaway.order).to receive(:calculate_total).and_return 4
    end

    it 'returns "Incorrect Total" when passed wrong total' do
      expect(takeaway.confirm_order(6)).to eq "Incorrect Total"
    end

    it 'thanks the customer for their order when passed correct total' do
      expect(takeaway.confirm_order(4)).to eq "Thank you for your order: £4.00"
    end

  end

  # context 'Add to Basket' do
  #
  #   it 'is expected to respond to add_to_basket' do
  #     expect(takeaway).to respond_to(:add_to_basket)
  #   end
  #
  #   it 'is expected to add a line item to a basket' do
  #     takeaway.add_to_basket(item, qty)
  #     expect(takeaway.basket).to eq [{:item=>item, :qty=>qty}]
  #   end
  #
  #   it 'returns confirmation message when adding items to basket' do
  #     expect(takeaway.add_to_basket("Pizza", 3)).to eq "3x Pizza added to your basket"
  #   end
  #
  # end

  #
end
