require_relative '../lib/menu'

describe Menu do
  
  subject(:menu) { described_class.new } # allows the use of 'dish' instead of 'subject' for clarity  
  
  describe "#load" do
    it 'loads the menu with HARDCODED dishes for now' do
      menu.load
      expect(menu.dishes.length).to eq 5
    end
  end

end
