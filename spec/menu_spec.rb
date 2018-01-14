require "menu"

describe Menu do 
  subject(:menu) { described_class.new }

  describe "#choices" do
    it "should have at least five menu options" do
      expect(menu.choices.length).to be >= 5 
    end

    it "every option should have a price" do
      without_prices = menu.choices.reject { |option| option.has_key?(:price) }
      expect(without_prices).to be_empty
    end

    it "every option should have a food" do
      without_food = menu.choices.reject { |option| option.has_key?(:food) }
      expect(without_food).to be_empty
    end
  end

  describe "#read" do
    it "should have at least five menu options" do
      expect(menu.choices.length).to be >= 5 
    end
  end
     
end
