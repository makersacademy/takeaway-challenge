require "order"

describe Order do
  it "allows to select some number of several available dishes" do
    expect(subject).to respond_to(:dishes).with(2).arguments

end



end
