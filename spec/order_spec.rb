require 'order'

describe Order do
  let(:menu_klass){ double('menu_klass', new: menu) }
  let(:text_klass){ double('text_klass', new: text) }
  subject(:order){ described_class.new(menu_klass.new,text_klass.new) }
  let(:dish1){ double('dish') }
  let(:dish2){ double('dish') }
  let(:text){ double('text') }
  let(:menu){ double('menu', dishes: { dish1 => 7.5, dish2 => 10.0 })}


  describe '#initialize' do
    it 'creates an empty order' do
      expect(order.overview.empty?).to be true
    end

    it 'initiates menu' do
      expect(order.menu).to eq menu
    end
  end

  describe '#show_menu' do
    it 'shows the menu' do
      expect(order.show_menu).to eq menu
    end
  end

  describe '#select_dishe' do
    it 'insert a single dish with 1 in quantity into the order' do
      order.select_dish(1,dish1)
      expect(order.overview[0]).to include 1, dish1, 7.5
    end

    it 'insert multiple dish with 1 in quantity into the order' do
      quantity = 1
      order.select_dish(quantity,dish1)
      order.select_dish(quantity,dish2)
      expect(order.overview).to include [1, dish1, menu.dishes[dish1]],[quantity,dish2,menu.dishes[dish2]]
    end

    xit 'insert multiple dish with multiple quantities into the order' do

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
      expect(order.place(order.show_sum)).to include order.overview
    end

    # it 'initiates a confirmation' do
    #   quantity = 1
    #   order.select_dish(quantity,dish1)
    #   order.select_dish(quantity,dish2)
    #   expect(order).to receive(:confirmation)
    #   order.place(17.5)
    # end

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

    xit 'returns a time stamp when order is delivered in one hour' do
      quantity = 2
      order.select_dish(quantity,dish1)
      order.select_dish(quantity,dish2)
      order.place(order.show_sum)
      time = (Time.now + (60*60)).strftime("%H:%M")
      msg = "Thank you! Your order was placed and will be delivered before #{time}"
      expect(order.confirmation).to eq msg
    end
  end

end
