require_relative '../lib/basket.rb'
require_relative '../lib/menu.rb'

describe Basket do
  let(:menu) { double(:menu, order:[naan,2]) }

  it "responds to the method 'view'" do
    expect(subject).to respond_to(:view)
  end

  it 'responds to the method price' do
    expect(subject).to respond_to(:price)
  end

  it "shows a list of items that have been ordered" do
    basket = Basket.new
    basket.order(:naan)
    expect(basket.view).to eq([:naan])
  end

  # it 'can keep a running total of my order' do
  #   basket = Basket.new
  #   basket.order(:rice)
  #   basket.order(:naan)
  #   expect(basket.price).to eq(300)
  # end

  #   describe '#order' do
  #
  #   it 'can order items of variable quantity off the menu' do
  #     expect(subject).to respond_to(:order).with(2).argument
  #   end
  #
  #   it 'cannot order items that are not on the menu' do
  #     expect{subject.order(:soup,5)}.to raise_error("Item not on menu")
  #
  #   end


end
