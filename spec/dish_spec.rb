require 'dish'

describe Dish do
  let(:name) {'Saag Paneer'}
  subject(:dish) { described_class.new(name) }

  it "has a name" do
    expect(dish.name).to eq name
  end
end
