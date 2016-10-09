require 'takeaway.rb'
require 'menu.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double(:menu) }

  describe '#initialize' do
    it 'intializes with an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#print_menu' do
    it 'shows the list of items available to order with prices' do
      expect(takeaway.read_menu).to eq({:tacos => 5.00, :burrito => 4.00, :enchiladas => 5.00, :margarita => 6.00})
    end
  end

  describe '#order' do
    it 'lets me select some number of several available dishes' do
      expect(takeaway).to respond_to(:order).with(2).arguments
    end

    it 'adds order to basket' do
      takeaway.order('tacos')
      expect(takeaway.basket).not_to be_empty
    end
  end

end
