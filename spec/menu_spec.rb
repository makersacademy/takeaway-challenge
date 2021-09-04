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

  it { is_expected.to respond_to(:list) }

  it 'loads 10 dishes on initialization' do
    expect(subject.list.count).to eq 10
  end

  it ':list returns menu items' do
    expect(subject.list).to eq list
  end
end