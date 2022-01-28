require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu }
  let(:order) { {"Salt & Pepper Chicken" => 6.30, "Prawn Crackers" => 2.80 } }

  it 'has a menu object' do
    expect(subject.menu).to eq ({ "Sweet & Sour Chicken Balls" => 6.30, "Salt & Pepper Chicken" => 6.30, "Chicken Fried Rice" => 6.80, "Prawn Crackers" => 2.80 })
  end

  it '#view_menu allows the user to view the menu' do
    expect(subject.view_menu).to eq ({ "Sweet & Sour Chicken Balls" => 6.30, "Salt & Pepper Chicken" => 6.30, "Chicken Fried Rice" => 6.80, "Prawn Crackers" => 2.80 })
  end

  it 'can order some number of dishes' do
    expect(subject.place_order(order)).to eq (order)
  end

end
