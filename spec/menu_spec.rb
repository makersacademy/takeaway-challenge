require "menu.rb"

describe Menu do
  
  subject {described_class.new(menu: {"Pilau rice": 1.50, "Poppadom": 0.50, "Mango Chutney": 0.30})}
  
  describe " #list" do
    it "exists" do
      expect(subject). to respond_to(:list)
    end

    it "should return menu" do
      expect(subject.list)
    end
    
  end

end