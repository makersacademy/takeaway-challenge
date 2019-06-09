require './lib/order.rb'

RSpec.describe Order do

  let(:item) { "pizza" }
  let(:quantity) { 12 }
  subject(:order) { described_class.new }

  it 'has an empty basket when initialized' do
    subject.basket
    expect(subject.basket).to be_empty
  end

  it '#select - stores orders selected by user' do
    expect { subject.select(item, quantity) }.to change { subject.basket.length }.by(1)
  end

end
