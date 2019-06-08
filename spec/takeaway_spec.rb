require 'takeaway'

RSpec.describe Takeaway do

  MENU = [{ "DAIFUKU" => 2 },
          { "ICHIGO"  => 3 }]

  SELECTION = [{ dish: "DAIFUKU", qty: 1 },
               { dish: "ICHIGO",  qty: 2 }]

  SUMMARY = "DAIFUKU £2.00"
  SUMMARY2 = "DAIFUKU £2.00\nICHIGO £3.00"

  it 'has a menu with a list of dishes and their price' do
    expect(subject.menu).to eq(MENU)
  end

  it 'can select dishes with quantities' do
    subject.select("DAIFUKU", 1)
    
    expect(subject.select("ICHIGO", 2)).to eq(SELECTION)
  end

  it 'summarises the total price' do
    subject.select("DAIFUKU", 2)
    subject.select("ICHIGO", 4)

    expect(subject.order_summary).to eq((2.00 * 2) + (4 * 3))
  end

end
