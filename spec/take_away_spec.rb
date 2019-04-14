require 'take_away'

describe TakeAway do
  before(:each) do
    @order = double :order
    @menu = double :menu
    @take_away = TakeAway.new(@order, @menu)
  end

  describe '#show_menu' do
    it 'prints the menu' do
      expect(@menu).to receive(:print_menu)
      @take_away.show_menu
    end
  end

  describe '#order_dish' do    
    it 'adds dish and qty to the order' do
      expect(@order).to receive(:add_dish).with('pizza', 3)
      @take_away.order_dish('pizza', 3)
    end
  end

  describe '#receipt' do
    it 'prints the receipt with the total taking the prices
    from the menu' do
      expect(@order).to receive(:print_order).with(@menu)
      @take_away.receipt
    end
  end

  describe '#confirm_order' do
    it 'sends confirmation text'
  end
end
