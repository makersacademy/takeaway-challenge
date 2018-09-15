require 'order'

describe Order do
  describe "#show" do
  it { is_expected.to respond_to :show }

  it "shows the order with the items picked" do
    subject.pick("Lasagna",2)
    subject.pick("Pasta",1)
    expect(subject.show).to eq([{"Lasagna" => 2}, {"Pasta" => 1}])
  end
  end

  describe "#pick" do
    it {is_expected.to respond_to(:pick).with(2).arguments}
  end
end
