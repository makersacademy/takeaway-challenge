require 'order'

describe Order do
  describe '#make_order' do
    it 'Should make a order' do
      expect(subject.current_order).to_not eq nil
    end
  end
end
