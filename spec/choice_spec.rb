require 'choice'

describe Choice do
  let(:name) { double :name }
  let(:price) { double :price }
  it 'returns price when called' do
    expect(subject).to respond_to(:price)
  end

  it 'the price to return 0 by default' do
    expect(subject.price).to eq(0)
  end

  it 'the name is "" by default' do
    expect(subject.name).to eq("")
  end
end
