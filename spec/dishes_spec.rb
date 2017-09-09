require 'dishes'

describe Dishes do
  let(:dishes) { double :dishes }
  subject(:cust){described_class.new(dishes)}
  it 'initializes with a list of dishes' do
    expect(subject.dishes).to eq(dishes)
  end
end
