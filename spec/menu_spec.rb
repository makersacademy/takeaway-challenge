require 'menu'
describe Menu do
  subject(:menu) { Menu.new }
  
  describe "#display_menu" do
    it 'displays menu: food followed by pricing' do
      expect(menu.display_menu).to eq(["Margherita: £12.5", "Carbonara: £15", "Lasagna: £16", "Penne almodoro: £19.99"])
    end
  end 
end