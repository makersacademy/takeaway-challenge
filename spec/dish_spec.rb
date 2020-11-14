require 'dish'

describe Dish do
  let(:name) { 'name' }
  let(:price) { 1 }
  subject(:dish) { Dish.new(name, price) }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :price }

  it 'returns name' do
    expect(subject.name).to eq name
  end

  it 'returns price' do
    expect(subject.price).to eq price
  end

end
