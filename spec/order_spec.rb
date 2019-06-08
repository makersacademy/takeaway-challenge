require 'order'

describe Order do
  describe 'initialization' do
    it 'has no items in list' do
      expect(subject.current_order).to be_empty
    end
  end
end
