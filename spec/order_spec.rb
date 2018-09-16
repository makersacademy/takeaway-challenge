require "order.rb"

describe Order do

  let(:menu) { double(:menu) }
  let(:dish) { double(:dish) }
  let(:fish_dish) { double(:fish_dish) }
  subject { Order.new(menu) }
  it 'is initialized with a menu default parameter' do
    order = Order.new(menu)
    expect(order.menu).to eq(menu)
  end
  it 'is initialized with basket as empty array' do
    expect(subject.basket).to eql([])
  end

  describe '#get_available_dishes' do
    it 'retrieves the available dishes from the menu' do
      allow(dish).to receive(:available).and_return(true)
      allow(fish_dish).to receive(:available).and_return(false)
      allow(menu).to receive(:dishes).and_return([dish, fish_dish])
      expect(subject.get_available_dishes).to eq([dish])
    end
  end

  describe '#add_to_basket' do
    it 'adds an item to the basket array' do
      allow(dish).to receive(:name).and_return(:chicken)
      allow(dish).to receive(:price).and_return(3)
      subject.add_to_basket(dish, 2)
      expect(subject.basket).to eql([
        {chicken: 3},
        {chicken: 3}
      ])
    end
  end

  describe '#find_dish' do
    it 'given name it finds a dish with the same name in the menu' do
      allow(dish).to receive(:available).and_return(true)
      allow(fish_dish).to receive(:available).and_return(false)
      allow(menu).to receive(:dishes).and_return([dish, fish_dish])
      allow(dish).to receive(:name).and_return(:chicken)
      expect(subject.find_dish("chicken")).to eql(dish)               
    end
    it 'returns error message when searching for an unavailable dish' do
      allow(dish).to receive(:available).and_return(true)
      allow(fish_dish).to receive(:available).and_return(false)
      allow(menu).to receive(:dishes).and_return([dish, fish_dish])
      allow(dish).to receive(:name).and_return(:chicken)
      allow(fish_dish).to receive(:name).and_return(:fish)
      expect {subject.find_dish("fish")}.to raise_error "Error, dish not available"
    end
  end

  describe '#show_menu' do
    it 'shows the menu with its prices' do
      allow(menu).to receive(:dishes).and_return([dish, fish_dish])
      allow(dish).to receive(:available).and_return(true)
      allow(fish_dish).to receive(:available).and_return(false)
      allow(dish).to receive(:name).and_return(:chicken)
      allow(fish_dish).to receive(:name).and_return(:fish)
      allow(dish).to receive(:price).and_return(3)
      allow(fish_dish).to receive(:price).and_return(2)
      expect(subject.show_menu).to eq([
        {chicken: 3},
        {fish: 2}                
      ])
      
    end
  end

  describe '#order_total' do
    it 'returns the total price of the basket' do
      allow(menu).to receive(:dishes).and_return([dish, fish_dish])
      allow(dish).to receive(:name).and_return(:chicken)
      allow(dish).to receive(:price).and_return(3)
      subject.add_to_basket(dish, 2)
      expect(subject.order_total).to eq(6)
    end
  end

  describe '#send_order_message' do
    it 'sends a text message confirming order' do
      allow(subject).to receive(:send_message).with("123456").and_return("Your order was successful")
      expect(subject.send_order_message("123456")).to eq("Your order was successful")
    end
    
  end

  describe '#complete_order' do
    it 'stores order in order_array' do
      allow(dish).to receive(:name).and_return(:chicken)
      allow(dish).to receive(:price).and_return(3)
      subject.add_to_basket(dish, 2)
      subject.complete_order
      time = (Time.now + 3600).strftime("%H:%M")
      expect(subject.orders).to eq([
        {time: subject.basket}      
      ])
    end
  end

  describe '#reset_basket' do
    it 'resets basket back to empty array' do
      subject.reset_basket
      expect(subject.basket).to be_empty
    end
  end


  

end