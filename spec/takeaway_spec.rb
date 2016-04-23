require 'takeaway'

describe Takeaway do
  let(:menu) { {'onion_bhaji' => 3.50, 'chicken dhansak' => 7.95, 'lamb jalfrezi' => 8.95} }

  describe '#menu' do
    it 'shows a list of dishes with prices' do
      expect(subject.menu).to eq menu
    end
  end



end
