require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it "list all the dishes available to select" do
    expect(menu.list_dishes).to be_an_instance_of Array
  end

  context "#select_dish" do
    it "return a dish (hash) with quantity" do
      expect(menu.select_dish("marinara", 2)).to eq({ dish: "marinara", price: "£5.50", quantity: 2 })
    end

    it "return quantity of 1 by default" do
      pizza = menu.select_dish("margherita")
      expect(pizza[:quantity]).to eq 1
    end

    it "raise an error if dish not in the menu" do
      expect { menu.select_dish("pineapple") }.to raise_error("dish not available")
    end

  end

end
