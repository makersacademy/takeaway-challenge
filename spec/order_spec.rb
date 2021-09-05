require 'order'

describe Order do
  let(:list) { [] }
  let(:restaurant) { double :restaurant, menu: list }
  let(:random_order) { rand(1...11) }
  
  subject { described_class.new(restaurant) }

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
    dish_number = random_order
    subject.add_to_order(dish_number)
    expect(subject.current_order).to include list[dish_number - 1]
  end

  it 'is able to remove from :current_order' do
    dish_number = random_order
    subject.add_to_order(dish_number)
    expect(subject.remove_from_order(dish_number)).to eq []
  end

  it 'notifies if specified dish is not in :current_order' do
    expect(subject.remove_from_order(random_order)).to eq 'Order does not contain specified dish'
  end
  
  it 'is able to view total price' do
    rand(10).times { subject.add_to_order(random_order) }
    expect(subject.total).to eq subject.current_order.sum { |d| d[:cost] }
  end

  it 'is able to send an order to restaurant' do
    allow(restaurant).to receive(:receive_order)
    subject.add_to_order(random_order)
    expect(subject.send_order_to_restaurant).to eq "Order has been sent to restaurant"
  end
end
