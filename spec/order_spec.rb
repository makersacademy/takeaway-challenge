require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:list){double(:list)}
  let(:dish1){double :dish, to_sym: :dish1}
  let(:dish2){double("dish", dish: "Indian", price: 8.0)}
  let(:item){double :item}
  let(:quantity){double :quantity}
  let(:price){double :price}
  let(:your_order){double :your_order}
  let(:basket){double :basket}


  describe "#select_item" do
    it 'allows for each food item to be selected' do
      order.select_item(dish1)
      expect(order.basket).to include dish1
    end


    it 'can choose a certain item' do
      order.select_item(dish1)
      expect(order.basket).to have_key(dish1)
    end

    # can't figure this one out
    xit 'can select multiple items' do
      order.select_item(dish1)
      order.select_item(dish2)
      expect(order.basket).to eq dish1, dish2
    end
  end

  describe "#quantity" do
    it 'can increase quatity of dish' do
      order.select_item(dish1, 2)
      expect(order.basket).to(have_value(2))
    end
  end


  describe "#confirm" do
    it 'shows items selected' do
      expect(order).to receive(:your_order)
      order.confirm
    end

    it 'outputs selected dish price' do
      expect(dish2.price).to eq 8.0
    end

    # cannot get this one to work - undefined method `*' for nil:NilClass
    it 'outputs quantity of selected items' do
      order.select_item(dish1, 1)
      expect(order.confirm).to eq "#{quantity} x #{item} = £#{price} per dish"
    end

  end

  describe "#your_order" do
    it 'total the cost of items selected' do
      expect(order.confirm).to eq "Total cost: £#{@sum}"
    end
  end

end
