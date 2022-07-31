require 'menu'

describe Menu do
  subject { described_class.new }
  let(:list) { [] }
  before do
    file = File.open('./lib/dishes.csv', "r")
    file.readlines.each do |line| 
      dish_number, dish, cost = line.chomp.split(",")
      list << { dish_number: dish_number.to_i, dish: dish, cost: cost.to_i }
    end
    file.close
  end

  it 'loads 10 dishes on initialization' do
    current_number_of_dishes = list.count
    expect(subject.list.count).to eq current_number_of_dishes
  end

  it ':list returns menu items' do
    expect(subject.list).to eq list
  end
end
