require 'order'

describe Order do
  subject { described_class.new }
  let(:list) { [] }
  before do
    file = File.open('./lib/dishes.csv', "r")
    file.readlines.each do |line| 
      dish, cost = line.chomp.split(",")
      list << { dish => cost.to_i }
    end
    file.close
  end

  it 'is able to view the menu' do
    expect(subject.view_menu).to eq list
  end

  it 'is able to add to order' do
    dish_number = 1
    subject.add_to_order(dish_number)
    expect(subject.current_order).to include list[dish_number - 1]
  end
  
  it 'is able to view total price' do
    subject.add_to_order(1)
    subject.add_to_order(2)
    expect(subject.total).to eq [list[0].values,list[1].values].flatten.sum
  end
end
