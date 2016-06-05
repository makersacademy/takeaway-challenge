
describe Menu do
  subject(:menu) {described_class.new}
  describe '#show_menu' do
    it 'should display the complete menu' do
      expect(menu.show_menu).to eq "naan"=>1, "biryani"=>4, "dosa"=>3, "masala papad"=>3, "chicken soup"=>2, "mushroom soup"=>2, "chicken"=>3, "fish"=>2, "pork"=>3
    end
  end
end
