require 'takeaway'
require 'menu'

describe Takeaway do

  let(:menu) { Menu.new }

  describe "display_menu" do
    it "displays the menu" do
      expect(subject.display_menu).to eq(menu.show_menu)
    end
  end

  describe "select_dish" do

    # it "checks if the dish is on the menu" do
    #   expect(subject.select_dish("Hello Meow")).to be_on_menu
    # end

    it "adds a dish to the order if it's on the menu" do
      subject.select_dish("Hello Meow")
      expect(subject.order).to include("Hello Meow")
    end

    it "raises an error if a dish is unavailable" do
      expect { subject.select_dish("None") }.to raise_error "Selection unavailable"
    end

  end

  describe "place_order" do

    it "puts the total cost of the order" do
      subject.select_dish("Hello Meow")
      subject.select_dish("Vanilla")
      subject.select_dish("Perforated Air")
      allow(subject).to receive(:text) { true }
      expect{ subject.place_order("+441234567890") }.to output("Total order cost is £32.73\n").to_stdout
    end

  end

end
