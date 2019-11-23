require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  describe "#show" do

    it "should return a list of dishes with prices" do
      message = ["1. Big Mac: £3.19", "2. Quarter Pounder: £3.19", "3. McChicken: £3.00",
        "4. Cheeseburger: £0.99", "5. Hamburger: £0.89", "6. French Fries: £1.09"].join("\n")

      expect { menu.show }.to output(puts message).to_stdout
    end

  end

  # describe "order" do
  #   it "should create an order" do
  #
  #   end

  # end

end
