require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu }
  # let(:order) { "Chicken Fried Rice", "Salt & Pepper Chicken" }

  it 'has a menu object' do
    expect(subject.menu).to eq ({ "Sweet & Sour Chicken Balls" => 6.30, "Salt & Pepper Chicken" => 6.30, "Chicken Fried Rice" => 6.80, "Prawn Crackers" => 2.80 })
  end

  it '#view_menu allows the user to view the menu' do
    expect(subject.view_menu).to eq ({ "Sweet & Sour Chicken Balls" => 6.30, "Salt & Pepper Chicken" => 6.30, "Chicken Fried Rice" => 6.80, "Prawn Crackers" => 2.80 })
  end

  it 'can order some number of dishes' do
    subject.place_order("Chicken Fried Rice", "Salt & Pepper Chicken")
    expect(subject.order).to eq ({ "Chicken Fried Rice" => 6.80, "Salt & Pepper Chicken" => 6.30 })
  end

  it 'returns a total value of order' do
    subject.place_order("Chicken Fried Rice", "Salt & Pepper Chicken")
    expect(subject.view_order).to eq (13.10)
  end

end
