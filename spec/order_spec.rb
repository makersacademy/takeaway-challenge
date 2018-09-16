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

  describe '#show_menu' do
    it 'shows list of available dishes' do

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
  end
  

end