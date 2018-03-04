require 'menu_selector'

describe MenuSelector do
  describe '#view_menu' do
    it 'returns the menu' do
      menu = Menu.new
      expect(subject.view_menu).to eq menu.menu_list
    end
  end

  describe '#order_food' do
    it 'returns the list of prices for food ordered' do
      subject.order_food('pizza', 'cheese_burger')
      expect(subject.total).to eq 15
    end
  end

  describe '#pay' do
    it 'raises an error if paying with incorrect amount' do
      Menu.new
      subject.order_food('pizza')
      expect{subject.pay(7)}.to raise_error 'That is not the correct amount!'
    end
  end
end
