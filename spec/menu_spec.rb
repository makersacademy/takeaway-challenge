require "menu.rb"

describe Menu do
  
  describe " #list" do
    it "exists" do
      expect(subject). to respond_to(:list)
    end

    it "should return menu" do
      dishes = {"Kolhapuri Murgi": 5.60, "Salmon Tikka Masala": 8.80, "Butter Chicken": 6.10, "Saag Paneer": 3.00, "Pilau rice": 1.50, "Coconut rice": 1.80, "Poppadom": 0.50, "Mango Chutney": 0.30}
      expect(subject.list).to eq(dishes)
    end
    
  end

end