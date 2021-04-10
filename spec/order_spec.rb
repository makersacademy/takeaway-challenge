require 'order'

describe Order do
  let(:dish_double_1) { double(:dish, :name => "pizza", :price => 4) }
  let(:dish_double_2) { double(:dish, :name => "fries", :price => 2) }
  let(:dish_double_3) { double(:dish, :name => "burger", :price => 5) }

  let(:menu) { double(:menu, :dishes => [dish_double_1, dish_double_2] ) }
  let(:menu) { double(:menu, :dishes => [dish_double_1, dish_double_2], :pick_dish => dish_double_3) }

  subject { described_class.new(menu) }

  context '#initialize' do
    let(:empty_menu) { double(:menu, :dishes => [] ) }

    it 'starts with a menu attribute'do
      expect(subject.menu).to be(menu)
    end

    it 'starts with an empty basket'do
      order = Order.new(empty_menu)
      expect(order.basket).to be_empty
    end

    it 'can store and return dishes' do
      subject.basket << dish_double_1
      expect(subject.basket).to eq [dish_double_1]
    end 
  end


  context '#add_dish' do

    it 'can respond to add dish' do
      expect(subject).to respond_to(:add_dish)
    end

    it 'can add a dish to the basket' do
      subject.add_dish(dish_double_3)
      expect(subject.basket[-1]).to be(dish_double_3)
    end

    it 'adds the price to the total' do
      expect { subject.add_dish(dish_double_3) }.to change { subject.total }.by 5
    end
  end

  context '#check_total' do
    it 'starts with an total of 0' do
      expect(subject.total).to be(0)
    end

    it 'can return the total when items are added' do
      subject.add_dish(dish_double_3)
      expect { subject.check_total }.to output(/Added together is 5/).to_stdout
    end
  end
end