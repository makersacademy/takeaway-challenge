require 'takeaway'
describe TakeAway do
  # let(:take_away) {double TakeAway.new}

  context 'when new instance of takeaway is made' do
    it 'should instantiate with an empty basket' do
      expect(subject.basket).to eq []
    end
    it 'should instantiate with a menu' do
      expect(subject.menu).to be_an_instance_of Menu
    end
  end
end
