require 'order'

RSpec.describe Order do

  it 'has an order basket' do
    expect(subject.order).to eq []
  end

  end
