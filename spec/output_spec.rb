require 'output'

describe Output do

  subject(:output) { described_class.new(order, dishes) }
  let(:order) { double :order }
  let(:dishes) { double :dishes }

  it 'can show the total' do
    expect(output).to respond_to(:show_total)
  end

  it 'can show the basket' do
    expect(output).to respond_to(:show_basket)
  end

  it 'can show the menu' do
    expect(output).to respond_to(:show_menu)
  end

end
