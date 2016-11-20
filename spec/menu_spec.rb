require 'menu'

describe Menu do
  let(:menu) {described_class.new}
  let(:incorrect_item) {double :incorrect_item}

  context "menu items" do
    it 'should be a hash' do
      expect(menu.menu).to be_instance_of Hash
    end
    it 'should show the list of foods' do
      expect(menu.menu).to include(:margherita)
    end
  end
end
