require './lib/menu'

describe OrderMenu do

  # Sets OrderMenu to recieve a Double object "dish_list" that contains dishes
  # Tests will still pass if this section is uncommented
  # let(:subject) do
    # dishes = Array.new
    # dishes << double(:dish, :item => "Burger", "price" => 3)
    # dishes << double(:dish, :item => "Pizza", "price" => 5)
    # dishes << double(:dish, :item => "Kebab", "price" => 4)
    # dish_list = double(:dishlist, :dishes => dishes)
    # subject = OrderMenu.new(dish_list)
  # end

  context "has a list of dishes" do
    it "returns a list of dishes" do
      expect(subject.print.class).to eq(Array)
    end
  end

  describe "Adding items" do
    context "adds wrong item" do
      item = "Diamond Ring"

      it "does not add item" do
        expect { subject.enter_selection(item, 1) }.to raise_error("Item not available")
      end
    end

    context "add correct item" do
      let(:item) { subject.dish_list.dishes[0].item }

      it "adds item" do
        expect { subject.enter_selection(item, 1) }.to change { subject.basket.count }.by(1)
      end
    end
  end

  describe "Placing order" do
    context "basket empty" do
      it "does not place order" do
        expect { subject.place_order(100) }.to raise_error("No selection made")
      end
    end

    describe "basket not empty" do
      before :each do
        subject.dish_list.dishes.each do |dish|
          subject.enter_selection(dish.item, 2)
        end
      end

      context "sum is wrong" do
        it "does not place order" do
          expect { subject.place_order(0) }.to raise_error("Incorrect amount")
        end
      end

      context "sum is correct" do
        before :each do
          allow(subject).to receive(:check) { "success!" }
        end
        it "places an order" do
          expect(subject.place_order(0)).to eq("success!")
        end
      end
    end
  end
end
