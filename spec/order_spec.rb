require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish_number) { 1 }
  let(:quantity) { 3 }
  let(:selection) {[
    {:dish=>"Chop Sooy, With White Mushrooms", :price => 2.50 },
    {:dish=>"Chop Sooy, With White Mushrooms", :price => 2.50 },
    {:dish=>"Chop Sooy, With White Mushrooms", :price => 2.50 }
  ]}
  let(:list) { }

  context 'customer input is valid:' do

    it "adds a specified number of available dishes to the order list" do
      order.add(dish_number, quantity)
      expect(order.selection).to eq selection
    end

    it "calculates the total amount of the order" do
      order.add(dish_number, quantity)
      total = 7.50
      expect(order.total).to eq total
    end

    it "reviews order (selections and price)" do
      order.add(dish_number, quantity)
      expect(order.review).to eq selection
    end
  end

  context 'customer input is invalid' do
    let(:dish_number) { 19 }

    it "raises error if user input is not on the menu" do
      expect{ order.add(dish_number, quantity) }.to raise_error "Invalid selection: please select a number between 1 and 18"
    end

  end

end
