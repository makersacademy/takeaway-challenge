require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu)}
  let(:menu) {double(:menu, :menu_list => {"chicken" => 15.50}) }

  describe '#list_menu' do

    it 'lists the current available menu items' do
      expect(takeaway.show_menu).to eq({"chicken" => 15.50})
    end
  end

  describe '#order' do
    it 'orders items from the menu' do
      order_result = "2 * chicken added to your order "
      expect(takeaway.order("chicken", 2)).to eq order_result
    end
  end

  describe '#basket' do
    it 'returns a string to the client showing their order' do
      takeaway.order("chicken", 2)
      expect(takeaway.basket).to eq "chicken * 2 for $31.0, "
    end
  end

end