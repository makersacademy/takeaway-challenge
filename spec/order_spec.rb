require 'order'

describe Order do
  let(:order) { Order.new }

  @dishes = [
    { "1. Vegetable Ramen" => 5 },
    { "2. Crispy Tofu" => 3, },
    { "3. Egg-fried Rice" => 3, },
    { "4. Chilli Prawns" => 6 }
  ]

  describe '#initialize' do

    it 'is initialized with an empty basket' do
    expect(order.basket).to eq([])
    end

  end

  describe '#add_to_basket' do
    it 'will add the correct dish to the basket' do
    order.add_to_basket(0)
    expect(order.basket).to include({ "1. Vegetable Ramen" => 5 })
    end
  end

  describe '#make_selection' do
    it 'will add the correct items to the basket' do
      allow(order).to receive(:gets).and_return( 1, 2, "exit\n" )
      order.make_selection
      expect(order.basket).to include({ "1. Vegetable Ramen" => 5 }, { "2. Crispy Tofu" => 3, })
    end
    
  end

  # describe '#show price' do
  #   it 'will display the correct price' do
  #     allow(order).to receive(:basket).and return(@dishes)
  #   end

  # end

end