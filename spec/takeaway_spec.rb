require 'takeaway'

describe Takeaway do

  it 'displays a menu' do
    expect(subject.menu).to eq "Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5
  end
end
