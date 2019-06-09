require 'takeaway'

RSpec.describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { { "DAIFUKU" => 2, "ICHIGO" => 3 } }
  let(:selection) { [{ dish: "DAIFUKU", qty: 1 },{ dish: "ICHIGO",  qty: 2 }] }

  it 'list dishes with their price' do
    expect(takeaway.show_menu).to eq(menu)
  end

  it 'select dishes with their quantity' do
    takeaway.select("DAIFUKU", 1)
    
    expect(takeaway.select("ICHIGO", 2)).to eq(selection)
  end

  it 'summarise the total price' do
    
    subject.select("DAIFUKU", 2)
    subject.select("ICHIGO", 4)

    expect(subject.order_summary).to eq(16)
  end

end
