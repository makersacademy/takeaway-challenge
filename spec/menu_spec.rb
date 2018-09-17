require 'menu'

describe Menu do
  let(:dish) { double(:dish1, name: "Mock A", price: "1.00") }
  let(:dish_class) { double("dish_class", new:dish) }
  subject(:menu) { Menu.new(dish_class) }
  describe '#add' do
    it 'adds a Dish to the menu' do
      menu.add("Food", 8.95)
      expect(subject.dishes).to eq [dish]
    end
  end

  describe '#print_list' do
    it 'prints a menu with a single dish' do
      menu.add("Food", "price")
      expect{subject.print_list}.to output("1. Mock A - £1.00\n").to_stdout
    end

    it 'prints a menu with multiple dishes' do
      2.times { menu.add("Food", "price") }
      expect{subject.print_list}.to output("1. Mock A - £1.00\n2. Mock A - £1.00\n").to_stdout
    end
  end

  describe '#choose' do
    it 'selects the users given dishes' do
      menu.add("food", "price")
      dish2 = double(:dish2, name: "Mock B", price: 2.00)
      allow(dish_class).to receive(:new) {dish2}
      menu.add("food", "price")
      dish3 = double(:dish3, name: "Mock C", price: 3.00)
      allow(dish_class).to receive(:new) {dish3}
      menu.add("food", "price")
      menu.choose("1,2,2,3")
      expect(menu.order).to eq [dish, dish2, dish2, dish3]
    end
  end
end
