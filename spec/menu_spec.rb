require 'menu'

describe Menu do

#   it "can print the menu" do
#     expect(:print_menu).to be_a_kind_of(String)
#   end

  describe "test print_menu" do
    let!(:menu)  { Menu.new }

    it "should print the menu when ran" do        
      expect { menu.print_menu }.to output(Menu::MEALS_LIST.to_s).to_stdout
    end
  end

  describe "test add_to_basket method" do
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

  describe "test add_to_receipt method" do
    let!(:menu)  { Menu.new }

    context "user adds item(s) to the basket" do
      # let!(:user_input) { double("user") } 
      it "stores the price on the receipt_list" do
        menu.process(4)
        expect(menu.receipt_list).to eq([10])
      end
    
      it "stores the prices on the receipt_list" do
        menu.process(3)
        menu.process(6)
        expect(menu.receipt_list).to eq([12.50, 4])
      end
    end
  end
end
