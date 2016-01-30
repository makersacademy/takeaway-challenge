require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe '#MENU' do
    it "should validate the menu keys" do
      expect(menu.read_menu.keys[0]).to be_a(Symbol)
    end

    it "should validate the menu valiues" do
      expect(menu.read_menu.values[0]).to be_a(Integer)
    end
  end
end
