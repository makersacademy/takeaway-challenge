require 'dish'

describe Dish do

  subject(:dish) { described_class.new(:name, :price) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:price) }

  it '#print dish' do
    expect(dish.print_dish).to eq "#{dish.name}: #{dish.price}"
  end

end