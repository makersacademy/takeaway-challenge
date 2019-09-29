require "dish_printer"

describe DishPrinter do
  subject(:some_class) { double(:order).extend(DishPrinter) }
  let(:dish1) { { name: 'Pizza', price: 8 } }
  let(:dish2) { { name: 'Cheeseburger', price: 6 } }
  let(:order) { double :order, ordered_items: [{ name: dish1, quantity: 1 }, { name: dish2, quantity: 3 }] }
  let(:menu) { double :menu, available_dishes: [dish1, dish2] }

  describe "#print_dish" do
    it 'prints formatter dish name and price' do
      expect(some_class.print_dish(dish1[:name], dish1[:price])).to eq 'Pizza (£8)'
    end
  end

  describe "#print_order" do
    it 'prints list of dishes with prices and quantities' do
      order1 = { name: 'Pizza', price: 8, quantity: 1 }
      order2 = { name: 'Cheeseburger', price: 6, quantity: 3 }
      ordered_dishes = [order1, order2]
      expect(some_class.print_order(ordered_dishes)).to eq "Pizza (£8) - 1\\nCheeseburger (£6) - 3"
    end
  end

  describe "#print_menu" do
    it 'prints list of dishes with prices' do
      menu_items = [dish1, dish2]
      expect(some_class.print_menu(menu_items)).to eq "Pizza (£8)\\nCheeseburger (£6)"
    end
  end

  describe "#print_total" do
    it 'prints order total' do
      expect(some_class.print_total(25)).to eq "Order Total: £25"
    end
  end
end
