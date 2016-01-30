require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, display: {}) }

  describe '#basket' do
    it 'starts with an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#show_menu' do
    it 'calls display method on menu' do
      expect(menu).to receive(:display)
      takeaway.show_menu
    end
  end

  # describe '#order' do
  #
  # end
  #
  # describe '#checkout' do
  #
  # end
end
