require 'menu'

describe Menu do
  
  context "the menu can list its items, along with their prices" do
    
    it "initialises with a hash, which is the menu" do
      
      expect(subject.menu).to eq({
        "Pepperoni Pizza" => 9,
        "Margherita Pizza" => 7,
        "Neapolitan Pizza" => 11,
        "Fiorentina Pizza" => 10,
      })

    end

  end

end
