require_relative '../lib/menu.rb'  # => true

describe Menu do  # ~> NoMethodError: undefined method `describe' for main:Object

  it 'can show a list of items' do
    expect(subject).to respond_to(:list_of_items)
  end

  describe '#order' do

  it 'can order items of variable quantity off the menu' do
    expect(subject).to respond_to(:order).with(2).argument
  end

  it 'cannot order items that are not on the menu' do
    expect{subject.order(:soup,5)}.to raise_error("Item not on menu")

  end

  # it 'can keep a running total of my order' do
  #   menu = Menu.new
  #   menu.order(:rice,2)
  #   menu.order(:naan,3)
  #   expect(subject.basket_price).to_eq(7)
  # end
  # it 'places items into the customers basket' do
  #   menu = Menu.new
  #   menu.order(:naan,2)
  #   expect(menu.basket).to eq(:naan)
  # end

end


end

# >> Thank you for ordering 3 x naan, costing £1.0 each
# >> Thank you for ordering 2 x rice, costing £2.0 each

# ~> NoMethodError
# ~> undefined method `describe' for main:Object
# ~>
# ~> /Users/matt/Dropbox/Projects/takeaway-challenge/spec/menu_spec.rb:3:in `<main>'
