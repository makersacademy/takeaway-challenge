require 'price_list'

describe Price_list do
  subject(:price_list) { described_class.new(details) }
  let(:details) { double :details }

  it 'should initialize with pricing details' do
    expect(price_list.details).to eq details
  end


end
