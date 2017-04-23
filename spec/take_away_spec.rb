require 'take_away'

describe Takeaway do
  describe '#menu' do
    it 'menu is empty hash' do
      expect(subject.menu).to respond_to menu
    end
  end
end
