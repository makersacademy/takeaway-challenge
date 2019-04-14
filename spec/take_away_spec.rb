require 'take_away'

describe TakeAway do
  describe '#show_menu' do
    it 'prints the menu' do
      menu = "Pizza - £5\nPasta - £7\nSalad - £6"
      expect(subject.show_menu).to eq menu
    end
  end

  describe '#order_dish' do
    it 'adds dish and qty to the order' do
      subject.order_dish('pizza', 3)
      pending('order should respond to add_dish')
        raise 'pending'
    end
  end

  describe '#receipt' do
    it 'prints the receipt with the total'
  end

  describe '#confirm_order' do
    it 'sends confirmation text'
  end
end
