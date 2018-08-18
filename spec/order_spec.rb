require 'order'

describe Order do

  describe '#show_menu' do
    it 'displays a menu with prices' do
      expect(subject.show_menu).to be_a_kind_of(Hash)
    end
  end

  describe '#order_takeaway' do
    it 'adds things from the menu to an order' do
      expect(subject.order_takeaway).to be_a_kind_of(Array)
    end
  end

end