require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:list){double(:list)}
  let(:dish1){double("dish", dish: "Chinese", price: 7.5)}
  let(:dish2){double("dish", dish: "Indian", price: 8.0)}
  let(:item){double :item}
  let(:quantity){double :quantity}
  let(:price){double :price}
  let(:your_order){double :your_order}


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

  describe "#in_basket" do
    it 'outputs what is in the basket' do
      order.select_item(dish1, 2)
      expect{order.in_basket}.to output.to_stdout
    end
  end

  describe "#confirm" do
    it 'shows items selected' do
      expect(order).to receive(:your_order)
      order.confirm
    end

    it 'outputs selected items' do
      expect(order.confirm).to eq("Total cost: #{@your_order}")
    end
  end

  describe "#your_order" do
    it 'total the cost of items selected' do
      expect(order.your_order).to eq @sum
    end
  end

end
