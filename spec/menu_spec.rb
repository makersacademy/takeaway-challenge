require 'menu'

describe Menu do

  let(:pizza) { double :pizza, name: 'Pizza', price: 7.85 }
  let(:pasta) { double :pasta, name: 'Pasta', price: 5.85 }
  let(:salad) { double :salad, name: 'Salad', price: 5.85 }
  subject { described_class.new(dishes: [pizza, pasta, salad]) }

  it 'should initialize with dishes and return list of dishes' do
    expect(subject.dishes).to eq [pizza, pasta, salad]
  end

end
