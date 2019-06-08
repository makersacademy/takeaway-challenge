require 'takeaway'

RSpec.describe Takeaway do

  MENU = [{ dish: "DAIFUKU", price: 2 },
          { dish: "ICHIGO", price: 3 }]

  it 'has a menu with a list of dishes and their price' do
    expect(subject.menu).to eq(MENU)
  end
  
end
