require 'menu'

describe Menu do
  let(:dish1) { double :dish1, dish: "burger", price: 5, dish_for_menu: [dish: "burger", price: 5] }
  let(:dish2) { double :dish2, dish: "chips", price: 3, dish_for_menu: [dish: "chips", price: 3]}
  let(:order) { double :order, dish_to_order: "chips", quantity: 1, order: [dish: "chips", quantity: 1] }

  describe '#add_dish' do
    it 'adds a dish and price to a list of dishes' do
      subject.add_dish(dish1)
      expect(subject.list_of_dishes.length). to eq 1
    end
  end

  describe '#view_menu' do
    it 'user can view the menu' do
      subject.add_dish(dish1)
      subject.add_dish(dish2)
      expect {subject.view_menu }.to output("Dish: burger, Price: 5\nDish: chips, Price: 3\n").to_stdout
    end
  end

  describe '#is_available?'
    it 'checks if the food ordered is available' do
      subject.add_dish(dish2)
      order.order
      expect(subject.is_available?(dish2)).to eq true
    end
end
