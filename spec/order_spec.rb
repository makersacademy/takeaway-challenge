require 'order'

describe Order do
  describe '#initialize' do
    it 'order initializes as blank' do
      expect(subject.ordered_dishes).to eq nil
    end
  end
end