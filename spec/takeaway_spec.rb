require "takeaway"
describe TakeAway do
  let(:neworder) { TakeAway.new }
  it { is_expected.to respond_to :menu }
  it { is_expected.to respond_to :add }
  it { is_expected.to respond_to :summary }
  it { is_expected.to respond_to :checkout }

  describe "#menu" do
    let(:menu) { Menu.new }
    it "shows items" do
      expect(menu.menu).to eq ({ "Char sui bun" => 3.99, "Peking duck" => 7.99, "Pork dumpling" => 2.99, "Spring roll" => 0.99 })
    end
  end

  describe "#summary" do
    it "shows empty basket" do
      expect(neworder.summary).to eq described_class::Error[2]
    end
  end
end
