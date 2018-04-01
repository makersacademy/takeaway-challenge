require 'order'

describe Order do
  describe '#order' do
    it 'you can order a dish' do
      expect(subject.order('Goi Ga', 2)).to eq("2X Goi Ga added to your basket")
    end
    it "remembers order" do
      subject.order('Goi Ga', 2)
      expect(subject.basket).to include("Goi Ga X 2 = £11.98")
    end
  end
  describe '#receipt' do
    it "shows whole ordered list" do
      subject.order('Goi Ga', 2)
      subject.order('peking duck', 3)
      expect(subject.receipt).to eq("Goi Ga X 2 = £11.98\npeking duck X 3 = £15.0\n Total = 26.98")
    end
  end

end
