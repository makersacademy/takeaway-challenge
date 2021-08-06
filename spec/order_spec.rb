require 'order'

describe Order do
  describe '#total_cost' do
    it 'calculates the total cost of dish selection' do
      expect(subject.total_cost).to eq 0
    end
  end
end
