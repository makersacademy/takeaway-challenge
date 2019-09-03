require 'order'

describe Order do
  describe ".menu" do
    it "should display the menu" do
      expect(subject.menu).to eq(DEFAULT_MENU)
    end
  end

  describe '.select' do
    it 'adds a number of dishes to my selection' do
      subject.select('pizza', 2)
      expect(subject.selection).to eq([{ meal: 'pizza', quantity: 2, total: 18 }])
    end
    it 'tells me the total of my order' do
      expect(subject.select('pizza', 2)).to eq("your order will cost £18")
    end
  end

  describe '.total' do
    it 'calculates the total of my order' do
      subject.select('curry', 4)
      expect(subject.total).to eq(24)
    end
  end
end
