require "menu"

describe Menu do 
  let(:option_class) {double :option_class, new: option} 
  let(:option) {double :option, price: 5, food: "tofu"}
  subject(:menu) { described_class.new }

  describe "#choices" do
    it "should have at least five menu options" do
      expect(menu.choices.length).to be >= 5 
    end

  end

  describe "#read" do

    it "should print out 5 lines of tofu and price of 5" do
      test_text = "tofu, price: 5\n" * 5
      expect{menu.read}.to output(test_text).to_stdout
    end

    it "should print out 5 lines of meat and price of 1000" do
      test_text = "meat, price: 1000\n" * 5
      allow(option).to receive(:price).and_return(1000)
      allow(option).to receive(:food).and_return("meat") 
      expect{menu.read}.to output(test_text).to_stdout
    end

  end
     
end
