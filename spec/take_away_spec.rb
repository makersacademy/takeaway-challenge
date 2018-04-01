require 'take_away.rb'

describe TakeAway do
  describe '#read_menu' do
    it 'shows menu' do
      expect(subject.read_menu).to eq({ "Goi Ga" => 5.99, "Cha Gio" => 4.99,
      "Vietnamese dumpling" => 2.99, "peking duck" => 5.00, "Pho Bo" => 6.99 })
    end
  end
  describe '#order' do
    it 'you can order a dish' do
      expect(subject.order('Goi Ga', 2)).to eq("2X Goi Ga added to your basket")
    end
  end
  it "remembers order" do
    subject.order('Goi Ga', 2)
    expect(subject.basket).to include("Goi Ga X 2 = £11.98")
  end
  describe '#receipt' do
    it "shows whole ordered list" do
      subject.order('Goi Ga', 2)
      subject.order('peking duck', 3)
      expect(subject.receipt).to eq("Goi Ga X 2 = £11.98\npeking duck X 3 = £15.0\n Total = 26.98")
    end
  end
end
