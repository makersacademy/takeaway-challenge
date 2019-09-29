require "dish_printer"

describe DishPrinter do
  subject(:some_class) { double(:order).extend(DishPrinter) }
  let(:dish1) { double :dish, name: 'Pizza', price: 8, print_dish: 'Pizza (£8)'}
  let(:dish2) { double :dish, name: 'Cheeseburger', price: 6, print_dish: 'Cheeseburger (£6)' }
  let(:order) {double :order, ordered_items: [{dish: dish1, quantity: 1}, {dish: dish2, quantity: 3}]}
  let(:menu) { double :menu, available_dishes: [dish1, dish2] }

  describe "#print_dish" do
    it 'prints formatter dish name and price' do
      expect(some_class.print_dish(name: dish1.name, price: dish1.price)).to eq 'Pizza (£8)'
    end
  end

  describe "#print_order" do

    it 'prints list of dishes with prices and quantities' do
      ordered_item1 = {dish: dish1.name, price: dish1.price, quantity: 1}
      ordered_item2 = {dish: dish2.name, price: dish2.price, quantity: 3}
      ordered_dishes = [ordered_item1, ordered_item2]
      expect(some_class.print_order(ordered_dishes)).to eq "Pizza (£8) - 1\\nCheeseburger (£6) - 3"
    end
  end

  describe "#print_total" do

    it 'prints order total' do
      expect(some_class.print_total(25)).to eq "Order Total: £25"
    end

  end


end
