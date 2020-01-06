require 'menu'

describe Menu do 

  describe '#initialize' do 
    it 'should contain a hash with first menu item' do 
      expect(subject.menu).to include ({pizza: 10} and {pasta: 8} and {pasta: 8} and {pasta: 8} and {chili: 12})
    end 

    it 'should start with pizza' do 
      expect(subject.menu).to start_with ({pizza: 10})
    end 

    it 'should be 5 items long' do 
      expect(subject.menu.length).to eq(5)
    end 

  end 

  describe '#print_menu' do
    it 'displays each menu item to the user' do
      expect(subject).to respond_to(:print_menu)
    end
    it 'should be a string, i.e. return nil' do 
      expect(subject.print_menu).to be_nil
    end 
  end

  describe '#order_process' do 
  # let(:shopping_basket_instance) {double :shopping_basket, add_item: @menu[0]}
    it 'should respond to and accept one arg' do 
      expect(subject).to respond_to(:order_process).with(1).arguments
    end 

    it 'should run add_item on shopping_basket instance when selection is made' do 
      shopping_basket_instance = double :shopping_basket, add_item: {:pizza=>10}, pizza_count: 0#, print_basket: "1 x Pizza, Cost: 10"
      allow(shopping_basket_instance).to receive(:pizza_count).and_return (0)
      subject = Menu.new(shopping_basket_instance)
      
      expect(shopping_basket_instance).to receive(:add_item).with({:pizza=>10})#.and to receive(:pizza_count).with(1)
      subject.order_process("1")
    end 

    xit 'should add Chili as menu item when selection is 5' do 
      shopping_basket_instance = double :shopping_basket, add_item: {:chili=>12}, chili_count: 0
      subject = Menu.new(shopping_basket_instance)
      expect(shopping_basket_instance).to receive(:add_item).with({:chili=>12})
      subject.order_process("5")
    end 
  end 

  # describe '#interactive_menu' do 
  #   xit 'should run print menu' do 

  #     expect(subject.interactive_menu).to receive(:print_menu)
  #   end 

  #   # it 'should run order_process' do 

  #   #   # expect(subject.interactive_menu).to receive(:order_process)
  #   # end 
  # end 

end 