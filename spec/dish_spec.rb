require 'dish'

describe Dish do

  let(:dish) { described_class.new("Salad Nicoise", 10.99) }

  it 'formats itself into a hash' do
    hash = { "Salad Nicoise" => 10.99 }
    expect(dish.present).to eq hash
  end

end
