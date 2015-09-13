require_relative '../lib/menu.rb'

describe Menu do

  it 'can show a list of items' do
    expect(subject).to respond_to(:list_of_items)
  end

  describe '#order' do

  it 'I can order items of variable quantity off the menu' do
    expect(subject).to respond_to(:order).with(2).argument
  end

  # it 'places items into the customers basket' do
  #   menu = Menu.new
  #   menu.order(:naan,2)
  #   expect(menu.basket).to eq(:naan)
  # end

end


end
