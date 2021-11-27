require 'menu'

describe Menu do

  it "can print the menu" do
    expect(:print_menu).to be
  end

  describe "#add_to_basket" do
    let!(:menu)  { Menu.new }

    context "user adds item(s) to the basket" do
      it "stores one meal in the basket" do
        menu.process(2)
        expect(menu.basket).to eq(["KFC"])
      end
    
      it "stores several meals in the basket" do
        menu.process(2)
        menu.process(4)
        expect(menu.basket).to eq(["KFC", "Bibimba_chicken", ])
      end
    end
  end

end
