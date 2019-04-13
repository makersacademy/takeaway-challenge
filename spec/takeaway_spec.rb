require 'takeaway'

describe Takeaway do

  it 'must be able to display a list of dishes with prices' do
    expect(subject.list("all")).to eq [{ :burger_meal => 5, :steak_meal => 20, :sausage_meal => 3 }]
  end

end
