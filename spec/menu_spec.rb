require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  context "list of items" do
    it 'should initialize with a list hash' do
      expect(menu.list).to be_instance_of Hash
    end
  end
  describe "#see_menu" do
    it 'should show the customer the menu' do
      expect(menu.see_menu).to eq menu.list
    end
  end


end
