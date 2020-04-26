require './lib/menu'

describe OrderMenu do
  # Sets OrderMenu to recieve a Double object "dish_list" that contains dishes
  # instead of using it's 'real' dependencies
  # Tests will still pass if this section is uncommented
  # let(:subject) do
    # subject = OrderMenu.new(dish_list)
  # end

  # Setup doube for dish list
  let(:dish_list) do
    dishes = Array.new
    dishes << double(:dish, :item => "Burger", "price" => 3)
    dishes << double(:dish, :item => "Pizza", "price" => 5)
    dishes << double(:dish, :item => "Kebab", "price" => 4)
    double(:dishlist, :dishes => dishes)
  end

  # If a unit test needs a filled basket include this context
  shared_context "filled basket" do
    let(:subject) do
      twilio = double(:twilio, :send_confirmation_text => "Sent confirmation text!")

      subject = OrderMenu.new(dish_list, twilio)
      subject.dish_list.dishes.each { |dish| subject.enter_selection(dish.item, 2) }
      subject
    end
  end

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
      include_context "filled basket"

      context "sum is wrong" do
        it "does not place order" do
          expect { subject.place_order(0) }.to raise_error("Incorrect amount")
        end
      end

      context "sum is correct" do
        let(:correct_amount) { subject.total }

        it "places an order" do
          expect(subject.place_order(correct_amount)).to eq("Sent confirmation text!")
        end
      end
    end
  end
end
