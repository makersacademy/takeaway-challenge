require './lib/menu'

describe Menu do
  context "has a list of dishes" do
    it "returns a list of dishes" do
      expect(subject.print.class).to eq(Array)
    end
  end

  describe "Adding items" do
    context "adds wrong item" do
      item = "Diamond Ring"

      it "does not add item" do
        expect { subject.enter_selection(item, 1) }.to raise_error("error")
      end
    end

    context "add correct item" do
      item = DishList.new.dishes[0].item

      it "adds item" do
        expect { subject.enter_selection(item, 1) }.to change{subject.basket.count}.by(1)
      end
    end
  end

  describe "Placing order" do
    context "basket empty" do
      it "does not place order" do
        expect { subject.place_order(100) }.to raise_error("error")
      end
    end

    describe "basket not empty" do
      before :each do
        @menu = Menu.new
        dishes = DishList.new.dishes
        dishes.each { |dish| @menu.enter_selection(dish.item, 2) }
      end

      context "sum is wrong" do
        sum = 0

        it "does not place order" do
          expect { @menu.place_order(sum) }.to raise_error("error")
        end
      end

      context "sum is correct" do
        it "places an order" do
          expect(@menu.place_order(@menu.total)).to eq("success!")
        end
      end
    end
  end


end
