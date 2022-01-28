require 'takeaway'

describe Takeaway do

  it 'has a menu object' do
    expect(subject.menu).to eq ({ "Sweet & Sour Chicken Balls" => 6.30, "Salt & Pepper Chicken" => 6.30, "Chicken Fried Rice" => 6.80, "Prawn Crackers" => 2.80 })
  end

  it '#view_menu allows the user to view the menu' do
    expect(subject.view_menu).to eq ({ "Sweet & Sour Chicken Balls" => 6.30, "Salt & Pepper Chicken" => 6.30, "Chicken Fried Rice" => 6.80, "Prawn Crackers" => 2.80 })
  end

end
