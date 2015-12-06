require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, list: {burger: 1.88, beef: 2.34, fries: 1.10}) }

  describe '#read_menu' do
    it 'should return what is present on the menu' do
      expect(takeaway.read_menu).to include(burger: 1.88, beef: 2.34, fries: 1.10)
    end
  end

end
