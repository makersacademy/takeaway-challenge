require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:menu_actual) { double(:dish, name: :chicken_foo_young, price: 4) }

  describe '#initialize' do
    it "has a hash of dishes names and prices at the start" do
      expect(menu.menu_list).to be_a Hash
    end
    it "displays the name of the dishes" do
      expect(menu.display_menu).to include :chicken_foo_young
    end
  end
end
