require 'takeaway'

describe TakeAway do
  subject(:t) {described_class.new}

  it "reads menu" do
    expect(t.read_menu).to eq ({"pizza" => 5, "soup" => 2})
  end
end
