require 'confirmer'

describe Confirmer do
  subject(:confirmer) { described_class.new({ 'Beans' => 3, 'Broccoli' => 4 }) }

  it 'initializes with items' do
    expect(confirmer.items).not_to be nil
  end

  it 'has a #confirm_order method' do
    expect(confirmer).to respond_to :confirm_order
  end
end
