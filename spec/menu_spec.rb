require 'menu'

RSpec.describe Menu do

  describe "#initialize" do
    it "assign a value to @dish_class" do
      menu = described_class.new("dish_class")
      expect(menu.dish_class).to eq "dish_class"
    end

    it "creats a empty @menu array" do
      menu = described_class.new("dish_class")
      expect(menu.menu).to eq []
    end
  end

  describe "#display_menu" do
    let(:dish) { double "dish" }

    it "returns a formated string" do
      allow(dish).to receive(:name).and_return("name")
      allow(dish).to receive(:price).and_return("price")
      allow_any_instance_of(described_class).to receive(:create_menu)
      menu = described_class.new("dish_class")
      formated_menu = [dish]
      expect(menu.display_menu(formated_menu)).to eq "0. name => £price"
    end
  end


  describe "#create_menu" do
    let(:dish_class) { double "dish_class" }

    it "pushes 2 dishes to @menu array" do
      allow(dish_class).to receive(:new).and_return 1
      menu = described_class.new(dish_class)
      menu.create_menu
      expect(menu.menu).to eq [1,1]
    end
  end
end
