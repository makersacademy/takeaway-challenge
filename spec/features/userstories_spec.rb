require 'menu'
require 'order'
require 'dish'

describe 'Takeaway' do

  before do
    @takeaway = Menu.new
  end

  it 'should allow my customer to see a list of dishes with prices' do
    expect{ @takeaway.see_dishes }.not_to raise_error
  end

  it 'should allow my customer to select any number of available dishes' do
    expect{ @takeaway.select_dishes('Margherita Pizza', 1) }.not_to raise_error
    expect{ @takeaway.select_dishes('Spaghetti Carbonara', 'Calzone', 2) }.not_to raise_error
  end

  it 'should allow my customer to check that their order size matches the sum of dishes in order' do
    order = @takeaway.select_dishes('Spaghetti Carbonara', 'Calzone', 2)
    expect{ order.check }.not_to raise_error
    expect( order.check ).to eq(2)
  end

end
