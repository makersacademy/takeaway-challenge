require 'menu'
describe Menu do

  subject(:menu) { described_class.new } 

  context "#show_menu" do
    it "displays a list of dishes and their price" do
      expect(menu.show_menu).to have_key(:Margherita)
      expect(menu.show_menu).to have_value(8.99)
    end
  end

  context "#available" do
    it 'checks if a dish is available for order' do
      expect(subject.available?("nduja")).to eq false
    end 
  end
end