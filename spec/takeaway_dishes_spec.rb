require 'takeaway_dishes'

describe Dishes do
  it 'can create an instance of a dish' do
    dishes = Dishes.new
    expect(dishes).to be_kind_of(Dishes)
  end

  it 'view a dish and get the dishes name and cost' do
    dishes = Dishes.new
    expect(dishes.select_dishes("korma")).to eq({ :item => "korma", :price => 3.80 })
  end

  it 'displays the cost of a dish on the menu' do
    dishes = Dishes.new
    expect(dishes.display_price("korma")).to eq(3.80)
  end

end
