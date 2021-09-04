require 'order'

describe Order do
  let(:restaurant) { double :restaurant, order: nil }
  subject { described_class.new(restaurant) }
  let(:list) { [] }
  before do
    file = File.open('./lib/dishes.csv', "r")
    file.readlines.each do |line| 
      dish_number, dish, cost = line.chomp.split(",")
      list << { dish_number: dish_number.to_i, dish: dish, cost: cost.to_i }
    end
    file.close
  end

  it 'is able to view the menu' do
    expect(subject.view_menu).to eq list
  end

  it 'is able to add to :current_order' do
    dish_number = 1
    subject.add_to_order(dish_number)
    expect(subject.current_order).to include list[dish_number - 1]
  end

  it 'is able to remove from :current_order' do
    dish_number = 1
    subject.add_to_order(dish_number)
    expect(subject.remove_from_order(dish_number)).to eq []
  end
  
  it 'is able to view total price' do
    subject.add_to_order(1)
    subject.add_to_order(2)
    expect(subject.total).to eq list[0][:cost] + list[1][:cost]
  end

  it 'is able to send an order to restaurant' do
    subject.add_to_order(1)
    expect(subject.send_order_to_restaurant).to_return 'Order has been sent to restaurant'
  end
end
