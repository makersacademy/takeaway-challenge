require 'menu'

describe "Menu" do

  subject(:menu) {Menu.new}

  describe "#print" do
  
    it "returns a list of menu options as a hash table" do
      menu.stub(:options) { 
      { :Pizza => 10, :Chips => 5, :Fish => 12, :Salad => 9, :Burger => 9 } }
      expect(menu.print).to eq menu.options
    end
    
  end

end

