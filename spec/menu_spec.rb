require 'menu'

# Show a list of dishes and prices
# # when we create Menu object, we want to Menu object to pass into Dishes to make up the Menu

describe Menu do

  subject(:menu) { described_class.new(dishes) }# we can get dishes inside of menu with DEPENDENCY INJECTION
  let(:dishes) do
    {              #we need Hash because we want to change Menu and it's easier with Hashes
      chicken: 4,
      falafel: 5
    }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end
end
