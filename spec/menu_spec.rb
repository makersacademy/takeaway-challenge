require 'menu'

describe TakeawayMenu do

  it "returns a menu with dishes and prices" do
    expect(subject.menu).to eq :lasagne => 12, :sausage_and_mash => 11.50, :lamb_saag => 9.00, :beef_wellington => 18.00
  end
end
