require 'menu'

describe Menu do

subject(:menu) { described_class.new }
  it 'is created with a list of dishes and prices' do
    expect(subject.dishes).to eq(["Chicken £3.50", "Pizza £4"])
  end

end
