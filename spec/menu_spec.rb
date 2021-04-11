require 'menu'
describe Menu do

  subject(:menu) { described_class.new }

  let(:dish) { double(:dish, Margherita: 8) }
    

  context "#show_menu" do
    it "displays a list of dishes and their price" do
      expect(menu.show_menu).to have_key(:Margherita)
      expect(menu.show_menu).to have_value(8.99)
    end
  end

end