
describe Menu do
  subject(:menu) {described_class.new}
  describe '#show_menu' do
    it 'should display the complete menu' do
      expect(menu.show_menu).to eq "chicken"=>3, "fish"=>2, "pork"=>3
    end
  end
end
