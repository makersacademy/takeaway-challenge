require 'menu'

describe Menu do
  describe '#display_menu' do

    it 'returns a list of items with prices when requested' do
      expect(subject.display_menu).to eq "Fish - £1.49\nJelly - £0.49\nLiver - £1.99\nEgg - £0.49"
    end

  end
end