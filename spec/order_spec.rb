require 'order'

describe Order do
  subject(:order){ described_class.new(menu,text)}
  let(:dish1){ double('menu') }
  let(:dish2){ double('menu') }
  let(:text){ double('text') }
  let(:menu){ double('menu', dishes: { dish1 => 7.5, dish2 => 10.0 })}


  describe '#initialize' do
    it 'creates an empty order' do
      expect(order.current.empty?).to be true
    end

    it 'initiates menu' do
      expect(order.menu).to eq menu
    end
  end

  describe '#show_menu' do
    it 'shows the menu' do
      allow(menu).to receive(:show)
      expect(menu).to receive(:show)
      order.show_menu
    end
  end

  describe '#select_dishe' do
    it 'insert a single dish with 1 in quantity into the order' do
      order.select_dish(1,dish1)
      expect(order.current[0]).to include 1, dish1, 7.5
    end

    it 'insert multiple dish with 1 in quantity into the order' do
      quantity = 1
      order.select_dish(quantity,dish1)
      order.select_dish(quantity,dish2)
      expect(order.current).to include [1, dish1, menu.dishes[dish1]],[quantity,dish2,menu.dishes[dish2]]
    end

    it 'raise argument error if quantity is zero or less' do
      expect{order.select_dish(0,dish1)}.to raise_error ArgumentError
    end
  end

  describe '#show_sum' do
    it 'should calculate and show the user the sum of the order' do
      quantity = 1
      order.select_dish(quantity,dish1)
      order.select_dish(quantity,dish2)
      expect(order.show_sum).to be 17.5
    end

    it 'deals with no orders' do
      expect(order.show_sum).to be 0
    end

  end

  describe '#place' do
    it 'should raise an error if not the correct sum' do
      quantity = 1
      order.select_dish(quantity,dish1)
      order.select_dish(quantity,dish2)
      expect{order.place(order.show_sum+1)}.to raise_error "Incorrect value - should be #{order.show_sum}"
    end

    it 'confirm order if the price is correct' do
      allow(text).to receive(:send_confirmation)
      quantity = 1
      order.select_dish(quantity,dish1)
      order.select_dish(quantity,dish2)
      expect(order.place(order.show_sum)).to include order.current
    end

  end

  describe '#confirmation' do
    before{allow(text).to receive(:send_confirmation)}

    it 'calls the confirmation' do
      quantity = 1
      order.select_dish(quantity,dish1)
      order.select_dish(quantity,dish2)
      expect(text).to receive(:send_confirmation)
      order.place(order.show_sum)
    end

  end

end
