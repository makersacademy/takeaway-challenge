require 'takeaway'

describe Takeaway do

  context 'on initialize' do
    let(:menu) { double :menu }
    let(:order) { double :order }
    subject(:takeaway) { described_class.new(menu, order) }
    it 'retrieves the menu on which the order will be based' do
      expect(takeaway.menu).to eq menu
    end
    it 'creates a holder for the coming order' do
      expect(takeaway.order).to eq order
    end
  end

  context 'on checking the menu' do
    let(:menu) { Menu.new}
    let(:order) { double :order }
    subject(:takeaway) { described_class.new(menu, order) }
    it 'displays exiting menu' do
      expect(takeaway.display_menu).to include("Egg Fried Rice" => 2.20,
                                              "Singapore Noodles" => 3.30,
                                              "Salt and Spicy Bean Curd" => 4.40
                                              )
    end
  end

end
