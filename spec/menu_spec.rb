require 'menu'

describe Menu do

  let(:dish) { double :dish }
  let(:price) { double :price }
  let(:menu) { Menu.new }

  describe ".new dishes" do
    it "equals an empty hash" do
      expect(menu.list_of_dishes).to eq([])
    end
  end

  describe "#add_dish" do
    it "adds a dish to dish_name" do
      menu.add_dish(dish)
      expect(menu.add_dish(dish)).to eq(dish)
    end
  end

  describe "#add_price" do
    it "adds a price to dish_price" do
      menu.add_price(price)
      expect(menu.add_price(price)).to eq(price)
    end
  end

  describe "#combine_list" do
    it "combines dish_name and dish_price into @list_of_dishes array" do
      expect { menu.combine_list }.to change { menu.list_of_dishes }.from([]).to([{ dish: @dish_name, price: @dish_price }])
    end
  end
end
