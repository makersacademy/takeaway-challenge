require 'price_list'

describe PriceList do

  describe '#display_price_list' do
    it 'displays the correct list of prices' do
      expect(subject.display_price_list).to eq PriceList::PRICE_LIST
    end
  end

  describe '#select_item' do
    it 'allows a user to select a certain amount of an item' do
      expect(subject.list_selection).to include { subject.select_item("Chicken Korma", 3) }
    end
  end

  describe '#calculate_total' do
      dummy_order = PriceList.new
      dummy_order.select_item("Chicken Korma", 3)
      dummy_order.calculate_total
      it 'calculates the correct total cost of the order' do
        expect(dummy_order.order_total).to eq 15
      end
  end

  describe '#place_order' do
    dummy_order = PriceList.new
    dummy_order.select_item("Chicken Korma", 3)
    dummy_order.calculate_total
    it 'correctly displays the order aswell as the total' do
      expect(dummy_order.place_order).to eq "Thank you for your order!\n You have ordered: #{dummy_order.list_selection}\n Which comes to a total of £#{dummy_order.order_total}."
    end
  end
end
