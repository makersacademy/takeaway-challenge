require 'takeaway'

describe TakeAway do

  describe '#initialize' do
    it 'has an empty basket by dfault' do
      expect(subject.basket).to be_empty
    end
  end

  describe '#order_dish' do
    it "checks if a dish doesn't exist and raise an error" do
      dish = 'Chicken'
      expect{ subject.order_dish(dish) }.to raise_error "This dish doesn't exist"
    end
  end

  describe '#read_menu' do
    it 'reads the menu of dishes' do
      subject.menu = [{ name: 'Chicken Poke', price: 7.99 }, { name: 'Salmon Poke', price: 8.99 }]
      result = ["Chicken Poke £7.99", 'Salmon Poke £8.99']
      subject.read_menu
      expect(subject.printed_menu).to eq result
    end
  end

  describe '#add_order' do
    it 'adds the order to the total' do
      dish = 'Chicken Poke'
      quantity = 2
      result = 15.98
      subject.order_dish(dish, quantity)
      expect(subject.total).to eq result
    end

    it 'adds the order to the basket' do
      dish = 'Chicken Poke'
      quantity = 2
      result = ['Chicken Poke x2 = £15.98']
      subject.order_dish(dish, quantity)
      expect(subject.basket).to eq result
    end
  end

  describe '#print_basket' do
    it 'prints the basket' do
      dish = 'Chicken Poke'
      quantity = 2
      subject.order_dish(dish, quantity)
      dish = 'Salmon Poke'
      quantity = 2
      subject.order_dish(dish, quantity)
      result = 'Chicken Poke x2 = £15.98, Salmon Poke x2 = £17.98'
      subject.print_basket
      expect(subject.basket_checkout).to eq result
    end
  end

  describe '#check_total' do
    it 'prints the total' do
      dish = 'Chicken Poke'
      quantity = 2
      subject.order_dish(dish, quantity)
      dish = 'Salmon Poke'
      quantity = 2
      subject.order_dish(dish, quantity)
      result = "Total: £33.96\n"
      expect { subject.check_total }.to output(result).to_stdout
    end
  end

end
