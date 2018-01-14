require "menu"

describe Menu do 
  subject(:menu) { described_class.new }

  describe "#choices" do
    it "should have at least five menu options" do
      expect(menu.choices.length).to be >= 5 
    end

  end

  describe "#read" do
    it "" do
      expect(menu.choices.length).to be >= 5 
    end
  end
     
end
