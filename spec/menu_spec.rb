require 'menu'

describe Menu do

  let(:burger) { double("burger", name: "burger", price: "15") }
  let(:pasta) { double("pasta", name: "pasta", price: "10") }
  let(:empty_menu_string) { "" }
  let(:full_menu_string) { "burger - £15\npasta - £10\n" }

  describe "#show" do
    it "shows an empty list of dishes by default" do
      expect(subject.show).to eq empty_menu_string
    end
  
    it "shows a pretty printed list of dishes and their price" do
      menu = Menu.new([burger, pasta])
      expect(menu.show).to eq full_menu_string
    end
  end
end