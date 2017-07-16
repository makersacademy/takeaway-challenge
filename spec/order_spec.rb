require 'order'
require 'menu'

describe Order do

  subject(:order) {described_class.new}

  describe '#pick_dish' do
    it { is_expected.to respond_to (:pick_dish) }

    it 'picks dish customer chooses' do
      expect(subject.pick_dish(@dishes)).to eq @dishes
    end


  end

end
