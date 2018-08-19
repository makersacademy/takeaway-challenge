require 'menu'

describe Menu do
  let(:mockLasagne) { double :lasagne, name: "Lasagne", price: 9}
  it "has an array of dishes" do
    expect(subject.dishes).to eq Menu::DEFAULT_MENU
  end
  
  describe "#display_menu" do
    it "displays each dishes name and price" do
      expect(subject.display_menu).to eq Menu::DEFAULT_MENU
    end
  end
end
