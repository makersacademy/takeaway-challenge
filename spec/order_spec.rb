require 'order'

describe Order do
  # let(:menu_double) { double :menu }
  let(:order)       { described_class.new }
  let(:dish_choice) { double :dish }
  let(:quantity)    { double(1) }
  # let(:dish) { double('dish) }


  describe 'a new order' do
    it 'starts with an empy basket' do
      expect(order.basket).to be_empty
    end

    it 'starts with a total of zero' do
      expect(order.total).to eq 0
    end
  end

  describe 'creating an order' do

    # before do
    #   allow(menu_double).to receive(:dishes).and_return({ dish_choice => 1 })
    # end

    it 'adds a dish and its quantity from the menu to an order' do
      order.add("doughnut")
      order.add("cake")
      expect(order.basket).to eq([{ "doughnut" => 2 }, { "cake" => 2 }])
    end

    it 'adds the cost of a dish to #price_count' do
      order.add("doughnut")
      order.add("cake")
      expect(order.price_count).to eq [2, 2]
    end

    # it 'can display the current total of an order' do
    #   order.add_dish(dish, 2)
    #   order.add_dish(dish, 3)
    #   expect(order.view_total).to eq(8)
    # end

    # it 'can view the basket' do
    #   expect(order.view_basket).to eq basket
    # end

    # it 'updates the total of the basket' do
    #   order.add(dish, 3)
    #   order.add(dish, 4)
    #   expect(order.total).to
    # end
  end
end
