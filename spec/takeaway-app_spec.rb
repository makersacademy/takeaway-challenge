require 'takeaway-app'

describe TakeAwayApp do
  before do
    @App = TakeAwayApp.new
  end
  describe '#show_menu' do
    it 'responds to show_menu' do
      expect(@App).to respond_to(:show_menu)
    end
    it 'puts the correct menu' do
      STDOUT.should_receive(:puts).with(" Pizza : 18.99 \n Curry : 7.49 \n Fish & Chips : 12.39 \n Kebab : 6.19 ")
      @App.show_menu
    end
  end
  describe '#make_order' do
    it 'responds to make_order' do
      expect(@App).to respond_to(:make_order)
    end
    it 'allows the user to make an order' do
      @App.stub(:gets).and_return("Curry\n", "Pizza\n", "finish\n")
      expect(@App.make_order).to eq true
    end
  end
  describe '#confirm_order' do
    before do
      @App.stub(:gets).and_return("Curry\n", "Pizza\n", "finish\n")
      @App.make_order
    end
    it 'responds to confirm_order' do
      expect(@App).to respond_to(:confirm_order)
    end
    it 'can confirm an order with the correct price' do
      STDOUT.should_receive(:puts).with(7.49)
      @App.confirm_order(0)
    end
  end
end