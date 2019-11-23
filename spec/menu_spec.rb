require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  describe "#show" do

    it "should return a list of dishes with prices" do
      message = ["Big Mac: £3.19", "Quarter Pounder: £3.19", "McChicken: £3.00",
        "Cheeseburger: £0.99", "Hamburger: £0.89", "French Fries: £1.09"].join("\n")

      expect { menu.show }.to output(puts message).to_stdout
    end

  end

end
