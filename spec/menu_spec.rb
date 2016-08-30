require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double(:dish) }

  context "Regular information retrieval" do
    describe "#price" do
      it "returns the price of a dish" do
        expect(menu.price("hamburger")).to eq 3
      end
    end

    describe "#has?" do
      it "returns true if item on menu" do
        expect(menu.has?("chips")).to eq true
      end
    end

    describe "#display" do
      it "returns formatted menu" do
        output = "Menu\n"\
                 "========================================\n"\
                 "Dish                               Price\n"\
                 "----------------------------------------\n"\
                 "hamburger                         £ 3.00\n"\
                 "cheeseburger                      £ 4.00\n"\
                 "quarter pounder                   £ 6.00\n"\
                 "curry chips                       £ 3.00\n"\
                 "chips                             £ 2.00\n"\
                 "chicken wrap                      £ 4.00\n"\
                 "veggie burger                     £ 5.00\n"\
                 "========================================\n"
        expect(menu.display).to eq output
      end
    end
  end

  context "Menu alteration" do
    describe "#remove_item" do
      it "removes a dish" do
        menu.remove_item("chips")
        expect(menu.has?("chips")).to eq false
      end
    end

    describe "#remove_item" do
      it "raises error when removing dish not on menu" do
        expect { menu.remove_item("squid") }.to raise_error "squid not on menu"
      end
    end

    describe "#add_item" do
      it "adds dish to menu" do
        menu.add_item("squid",5)
        expect(menu.has?("squid")).to eq true
      end
    end
  end
end
