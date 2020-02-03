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

  describe "#add_to_list" do
    it "adds dish_name and dish_price into @list_of_dishes array" do
      expect { menu.add_to_list }.to change { menu.list_of_dishes }.from([]).to([{ dish: @dish_names, price: @dish_prices }])
    end
  end

  describe "#display_menu" do
    it "displays full '@list_of_dishes' " do
      expect(menu.display_menu).to eq(menu.list_of_dishes.each { |dish| pp dish })
    end
  end
end
