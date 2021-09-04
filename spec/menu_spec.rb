require 'menu'

describe Menu do
  let(:list) { [] }
  before do
    file = File.open('./lib/dishes.csv', "r")
    file.readlines.each do |line| 
      dish, cost = line.chomp.split(",")
      list << { dish => cost.to_i }
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