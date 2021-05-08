require 'menu'

describe Menu do
  let(:dishes) { [
    double('dish', to_string: "Vegan Mixed Grill - £5.50"),
    double('dish', to_string: "Sweet Potato Fries - £6.50"),
    double('dish', to_string: "Vegan Burger - £7.50"),
    double('dish', to_string: "Chickpea Tagine - £5.50"),
    double('dish', to_string: "Vegan Nut Roast - £6.50"),
    double('dish', to_string: "Vegetable Curry - £5.50"),
    double('dish', to_string: "Fruit Salad - £4.50"),
    double('dish', to_string: "Vegan Hot Dog - £4.50"),
    double('dish', to_string: "Vegan Pizza - £8.50"),
    double('dish', to_string: "Vegetable Soup - £4.50"),
  ] }
  let(:menu) { Menu.new(dishes) }

  describe '#list_dishes' do
    it 'returns a string containing all dishes and their prices' do
      expect(menu.list_dishes).to eq("1. Vegan Mixed Grill - £5.50\n2. Sweet Potato Fries - £6.50\n3. Vegan Burger - £7.50\n4. Chickpea Tagine - £5.50\n5. Vegan Nut Roast - £6.50\n6. Vegetable Curry - £5.50\n7. Fruit Salad - £4.50\n8. Vegan Hot Dog - £4.50\n9. Vegan Pizza - £8.50\n10. Vegetable Soup - £4.50")
    end
  end
end
