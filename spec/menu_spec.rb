# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require "menu"

describe Menu do

  subject { described_class.new }
  
  let(:menu) { { test_dish1: 7.50, test_dish2: 6.00, test_dish3: 4.00 } }
  
  before(:example) do
    allow(subject).to receive(:menu).and_return(menu)
  end

  describe "#menu" do
    it "has a list of dishes with prices" do
      expect(subject.menu).to include(test_dish1: 7.50)
    end
  end

  describe "#show_menu" do
    it "displays the menu" do
      expect(subject.show_menu).to eq test_dish1: 7.50, test_dish2: 6.00, test_dish3: 4.00
    end
  end
end
