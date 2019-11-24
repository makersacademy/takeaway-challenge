require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  it "is not empty" do
    expect(menu.dishes).not_to be_empty
  end

  it "checks that the dish is on the menu" do
    expect(menu.has_dish?("beef")).to eq false
  end

  describe "#display_menu" do
    it "display a list of dishes with prices" do
      expect { menu.display_menu }.to output("rice : £2.5\nchips : £3\nfish : £7\n").to_stdout
    end
  end

end
