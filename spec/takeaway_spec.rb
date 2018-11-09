require 'takeaway'

describe Takeaway do
  describe '#view_dishes' do
    it 'should provide a list of fishes' do
      expect(subject.view_dishes).not_to eq nil
    end
  end
end
