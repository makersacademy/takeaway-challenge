require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, list: { 'fries' => 1.99 }) }

  describe '#basket' do
    it 'starts with an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#show_menu' do
    it 'calls list method on menu' do
      expect(menu).to receive(:list)
      takeaway.show_menu
    end
  end

  describe '#order' do
    it 'raises error if item is not in menu' do
      message = 'Item not in menu!'
      expect { takeaway.order('chicken') }.to raise_error(message)
    end

    it 'adds item to basket' do
      takeaway.order('fries')
      expect(takeaway.basket).to include 'fries'
    end
  end

  # describe '#checkout' do
  #
  # end
end
