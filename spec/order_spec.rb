require 'order'

describe Order do

  describe "#menu" do
    it 'Should start the program with a menu' do
      expect(subject.menu).to eq(Order::DEFAULT_MENU)
    end
  end

  describe "#select_dishes" do
    it 'should return an array for selected dishes' do
      expect(subject.select_dishes("coffee", 2)).to eq subject.selection
    end
  end

end
