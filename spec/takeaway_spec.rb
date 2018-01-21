require 'takeaway'

describe Takeaway do
  let(:order) { double :order }
  let(:menu) {double :menu, :display => "#{:food} £#{:price}",
                            :dish_list => {"pizza" => 3.00} }
  let(:message) { double :message }
  let(:takeaway) { described_class.new(menu) }

  describe '#menu' do
    it 'displays the menu' do
      expect(takeaway.display_menu).to eq "#{:food} £#{:price}"
    end
  end

  describe '#order' do
    it 'raises an error when dish is not on the menu' do
      expect{takeaway.order("ramen")}.to raise_error 'There is no such dish on the menu'
    end
  end

  describe '#basket summary' do
    it 'shows dishes in the basket' do
      takeaway.order("pierogi")
      expect(takeaway.basket_summary).to eq "pierogi"=>1
    end

    it 'returns an empty basket if it is empty' do
      expect(takeaway.basket_summary).to eq "Basket empty"
    end
  end

  describe '#complete order' do
    it 'raises an error if no orders added' do
      expect{takeaway.confirm_order}.to raise_error 'No orders have been added'
    end
  end

end
