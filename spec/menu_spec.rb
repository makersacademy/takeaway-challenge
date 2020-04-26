require './lib/menu'

describe Menu do 

  describe "#full_menu" do 
    it "responds to full_menu" do  
      expect(subject).to respond_to(:full_menu)
    end 
  end 
end 