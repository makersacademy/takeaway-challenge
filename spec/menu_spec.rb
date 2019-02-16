require 'menu'

describe Menu do

subject(:menu) { described_class.new }
  it 'is created with a list of dishes' do
    expect(subject.dishes).to eq(["Chicken", "Pizza"])
  end

end
