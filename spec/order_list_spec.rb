require 'order_list'

describe OrderList do
  # let(:dish) { double :dish }
  # let(:dish_class) { double :dish_class, new: dish }
  # let(:menu) { Menu.new(dish_class) }
  #
  # context '#' do
  #   it "" do
  #     menu.add(dish)
  #     dish_display = "36. Chicken Korma £7.95"
  #     expect(dish).to receive(:display).and_return(dish_display)
  #     expect(menu.view).to eq "#{dish_display}\n"
  #   end

  it "adds items to an order list" do
    expect(subject.add("Chicken Korma", 1)).to eq "Item added"
  end

  it "checks the last item added includes the item added" do
    subject.add("Chicken Korma", 1)
    expect(subject.check_last).to eq "Chicken Korma - 1"
  end

  it "checks the cost of an item" do
    current_price = 7.95
    subject.add("Chicken Korma", 1)
    expect(subject.calculate_cost([Dish.new(36, "Chicken Korma", 7.95)])).to eq current_price
  end
end
