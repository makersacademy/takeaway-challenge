require 'order'

describe Order do

  subject(:order) { described_class.new(@menu) }

  before(:each) do
    @menu = double('menu')
    allow(@menu).to receive(:list).and_return({ korma: 4, jalfrezi: 6, pilau: 2, naan: 2.5 })
    allow(@menu).to receive(:has_dish?).and_return(true)
  end

  it 'should take orders from the customer' do
    expect(order).to respond_to(:take).with(1..2).arguments
  end

  it 'should add dishes to the basket' do
    order.take('korma')
    expect(order.basket).to eq({ korma: { price: 4, quantity: 1 } })
  end

  it 'should add multiple dishes to the basket' do
    order.take('jalfrezi')
    order.take('korma')
    expect(order.basket).to eq({ jalfrezi: { price: 6, quantity: 1 }, korma: { price: 4, quantity: 1 } })
  end

  it 'should allow quantities to be specified when ordering' do
    order.take('jalfrezi', 2)
    order.take('korma', 2)
    expect(order.basket).to eq({ jalfrezi: { price: 6, quantity: 2 }, korma: { price: 4, quantity: 2 } })
  end




  # expect(order.basket).to eq({ jalfrezi: { price: 6, quantity: 0 }, korma: { price: 4, quantity: 1 }, pilau: { price: 2, quantity: 0 }, naan: { price: 2.5, quantity: 0}})










end