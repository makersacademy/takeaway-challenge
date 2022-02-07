require_relative '../lib/menu'
# require_relative '../lib/dish'

describe Menu do
  
  subject(:menu) { described_class.new } # allows the use of 'dish' instead of 'subject' for clarity  
  
  describe "#load" do
    it 'loads the menu with HARDCODED dishes for now' do
        menu.load
        expect(menu.dishes.length).to eq 5
    end
  end

  # describe "#show_menu" do
  #  it 'shows the dishes on the menu' do
  #      menu.load
  #      expect{ menu.show_menu }.to output("Sweetcorn Patties 3.99\nThai Red Curry (King Prawn) 6.99\nThai Red Curry (Vegetable) 5.99\nSingapore Noodles (Vegetable) 4.99\nSteamed Rice 2.99\n").to_stdout
  #  end
  #end

end
