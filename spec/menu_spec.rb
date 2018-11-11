require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it { expect(menu.menu).to eq Menu::MENU}

  describe "#show menu" do
    it "shows the menu" do
      expect(menu.show).to eq Menu::MENU
    end
  end

  # describe "#available" do
  #   it "checks if a dish is available" do
  #     expect(menu.available?("Ruby's Salad")).to be true
  #     expect(menu.available?("Python's Steak")).to eq true
  #     expect(menu.available?("Rock's Soup")).to eq false
  #     expect(menu.available?("Makers' Tagliolini")).to eq false
  #   end
  # end
end
