require 'take_away'

describe TakeAway do

  subject(:take_away) { described_class.new(menu) }
  let(:menu) { { "Tacos" => 4.95, "Scrambled Eggs" => 3.50 } }

  describe "#read_menu" do
    it "returns a menu with list of dishes and prices" do
      allow(menu).to receive(:display) { menu }
      expect(subject.read_menu).to eq menu
    end
  end

  describe "#order(dish, quantity)" do
    context "when quantity is not specified" do
      it "adds one dish and price to the basket" do
        subject.order("Tacos")
        expect(subject.basket).to include({ "Tacos" => 4.95 })
      end

      it "returns a message confirming what you added to the basket" do
        message = "1x tacos(s) added to your basket"
        expect(subject.order("Tacos")).to eq message
      end
    end

    context "when quanity is specified" do
      it "adds multiple dishes and prices to the basket" do
        subject.order("Tacos", 2)
        expect(subject.basket).to include({ "Tacos" => 4.95 }, { "Tacos" => 4.95 })
      end

      it "returns a message confirming what you added to the basket" do
        message = "2x scrambled eggs(s) added to your basket"
        expect(subject.order("Scrambled Eggs", 2)).to eq message
      end
    end
  end

  # describe "#basket_summary" do
  #   it "returns the contents of your basket when one item is ordered" do
  #     subject.order("Scrambled Eggs")
  #     message = "Scrambled Eggs x1 = £3.5"
  #     expect(subject.basket_summary).to eq message
  #   end
  #
  #   it "returns the contents of your basket when multiple items are ordered" do
  #     subject.order("Scrambled Eggs", 3)
  #     message = "Scrambled Eggs x3 = £10.5"
  #     expect(subject.basket_summary).to eq message
  #   end
  # end

end
