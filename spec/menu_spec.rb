require 'menu'

describe Menu do
  describe '#menu' do
    it 'should include a hash of menu items and prices' do
      expect(subject.list.first).to eq ["muffin", 3]
    end
  end
end
