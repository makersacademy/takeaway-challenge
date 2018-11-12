require 'Order'

describe Order do

  dish_1_name = "Chicken jalfrezi"
  dish_1_price = 7.99
  dish_2_name = "Lamb bhuna"
  dish_2_price = 8.99

  let(:dish_1_dbl) { double(:name => dish_1_name, :price => dish_1_price) }
  let(:dish_2_dbl) { double(:name => dish_2_name, :price => dish_2_price) }

  it 'adds one requested item to the order' do
    subject.add_item(dish_1_dbl)
    expect(subject.order_items.size).to eq 1
  end

  it 'keeps multiple items in the order' do
    subject.add_item(dish_1_dbl)
    subject.add_item(dish_2_dbl)
    expect(subject.order_items.size).to eq 2
  end

  it 'correctly reports the order' do
    subject.add_item(dish_1_dbl)
    subject.add_item(dish_2_dbl)
    expected_dish_1 = [dish_1_name, dish_1_price]
    expected_dish_2 = [dish_2_name, dish_2_price]
    expected_output = [expected_dish_1, expected_dish_2]
    expect(subject.list_order).to eq expected_output
  end

  it 'correctly calculates the total' do
    subject.add_item(dish_1_dbl)
    subject.add_item(dish_2_dbl)
    expect(subject.give_total).to eq(dish_1_price + dish_2_price)
  end

end
