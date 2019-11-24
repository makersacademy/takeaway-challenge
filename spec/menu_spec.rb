require "menu"

describe Menu do
   subject { described_class.new }
   
  
  context "Its a menu" do
    
    it "Checks if it has any dishes" do
      expect(subject.show_menu).to include("Fish")
    end
    
  end
end
