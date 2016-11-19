require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  context "menu items" do
    it 'should initialize with a list hash' do
      expect(menu.list).to be_instance_of Hash
    end
    it 'should have a list of foods' do
      expect(menu.list).to include(:toast)
    end
  end
end
