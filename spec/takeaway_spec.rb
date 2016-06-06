require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu,messenger)}
  let(:menu) {double :menu, view_menu: {fish: 3.99, chips: 1.99}}
  let(:messenger) {double :messenger, send_message: "message sent"}

  describe '#view_menu' do
    it 'return the contents of the menu to the console' do
      expect(menu).to receive(:view_menu)
      takeaway.view_menu
    end
  end

  describe '#add_menu_items' do
    it 'allows user to add items to the menu' do
      expect(menu).to receive(:add_items)
      takeaway.add_menu_items({fish: 3.99, chips: 1.99})
    end
  end

  describe '#order' do
    it 'returns string containing item ordered and current total cost' do
      expect(takeaway.order("chips", 4)).to eq ("4x chips added to basket, current total: 7.96")
    end

    it 'adds correct number of items to basket' do
      takeaway.order("chips", 4)
      takeaway.order("fish", 2)
      expect(takeaway.basket).to eq ("4x chips (@1.99 each), 2x fish (@3.99 each), current total: 15.94")
    end

    it 'returns error if dish does not match any item menu' do
      expect{takeaway.order("dogfood")}.to raise_error ("Sorry 'dogfood' is not an item on the menu")
    end
  end

  describe '#basket' do
    it 'returns string containing basket contents' do
      takeaway.order("chips", 4)
      takeaway.order("fish", 2)
      expect(takeaway.basket).to eq ("4x chips (@1.99 each), 2x fish (@3.99 each), current total: 15.94")
    end
  end

  describe '#total' do
    it 'returns total value of order' do
      takeaway.order("chips", 4)
      expect(takeaway.total).to eq 7.96
    end
  end

  describe '#checkout' do
    it 'sends message' do
      takeaway.order("chips", 4)
      expect(messenger).to receive(:send_message)
      takeaway.checkout
    end

    it 'resets current_order & total' do
      takeaway.order("chips", 4)
      takeaway.checkout
      expect(takeaway.basket).to eq "current total: 0"
    end

    it 'returns confirmation string' do
      takeaway.order("chips", 4)
      expect(takeaway.checkout).to eq   "Thank you! Your order was placed and will be delivered before #{(Time.now + (3600)).strftime("%R")}."
    end
  end
end
