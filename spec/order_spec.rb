require 'order'

describe Order do
  describe '#see_menu' do
    it 'returns an Hash of dishes' do
      expect(subject.see_menu).to be_instance_of(Hash)
    end
  end
end