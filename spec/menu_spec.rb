require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  context "menu items" do
    it 'should initialize with a list hash' do
      expect(menu.list).to be_instance_of Hash
    end
    it 'should have a list of foods' do
      expect(menu.list).to include(:scrambled_eggs)
    end
  end
  describe "#see_menu" do
    it 'should show the customer the menu' do
      expect(menu.see_menu).to eq menu.list
    end
  end


end
