require 'takeaway'

RSpec.describe Takeaway do

  MENU = [{ dish: "DAIFUKU", price: 2 },
          { dish: "ICHIGO",  price: 3 }]

  SELECTION = [{ dish: "DAIFUKU", qty: 1 },
               { dish: "ICHIGO",  qty: 2 }]

  it 'has a menu with a list of dishes and their price' do
    expect(subject.menu).to eq(MENU)
  end

  it 'can select dishes with quantities' do
    subject.select("DAIFUKU", 1)
    
    expect(subject.select("ICHIGO", 2)).to eq(SELECTION)
  end
  
end
