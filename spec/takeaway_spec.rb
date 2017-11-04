require 'takeaway'
describe TakeAway do
   let(:take_away) {described_class.new}
   let (:menu) {double 'fake menu', read_menu: [{"Chocolate Melt"=>7.99}, {"Apple Crumble"=>6.99}, {"Banana Split"=>6.99}]}

  context 'when new instance of takeaway is made' do
    it 'should instantiate with an empty basket' do
      expect(take_away.basket).to eq []
    end
    it 'should instantiate with a menu' do
      expect(take_away.menu).to be_an_instance_of Menu
    end
  end
  describe '#read_menu' do
    it 'should print the items on the menu'do
      expect(take_away.read_menu).to eq menu.read_menu
    end
  end
end
