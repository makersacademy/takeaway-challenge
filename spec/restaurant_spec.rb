require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  describe "Creating and editing the menu" do
    let(:food) { "tofu" }
    let(:price) { "£9" }

    context "editing the menu" do
      # subject { restaurant.create(food, price) }
      let(:dish) { {food => price} }
      it "adds a dish to the menu list" do
        expect(restaurant.add_item_to_menu(food, price)).to include {dish}
      end

      it "removes a dish from the menu list" do
        restaurant.remove_from_menu(dish)
        expect(restaurant.menu).not_to include dish
      end

      it "loads dishes to menu array" do
        restaurant.add_file_to_menu
      end
    end
  end
end
