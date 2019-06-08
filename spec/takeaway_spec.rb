require 'takeaway'

RSpec.describe Takeaway do
  subject(:takeaway) { described_class.new }

  MENU = { "DAIFUKU" => 2,
           "ICHIGO"  => 3 }

  SELECTION = [{ dish: "DAIFUKU", qty: 1 },
               { dish: "ICHIGO",  qty: 2 }]

  SUMMARY = "DAIFUKU £2.00"
  SUMMARY2 = "DAIFUKU £2.00\nICHIGO £3.00"

  it 'list dishes with their price' do
    expect(takeaway.menu).to eq(MENU)
  end

  it 'select dishes with their quantity' do
    takeaway.select("DAIFUKU", 1)
    
    expect(takeaway.select("ICHIGO", 2)).to eq(SELECTION)
  end

  it 'summarise the total price' do
    takeaway.select("DAIFUKU", 2)
    takeaway.select("ICHIGO", 4)

    expect(takeaway.order_summary).to eq((2.00 * 2) + (4 * 3))
  end

end
