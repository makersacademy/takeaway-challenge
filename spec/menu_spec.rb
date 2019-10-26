require 'menu'

describe Menu do
  describe '#menu' do
    it 'contains a menu' do
      expect(subject.menu).to include "Gyoza"
    end
  end
end
