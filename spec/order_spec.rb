require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:item_list){double :item_list, new: list, on_list?: true}
  let(:list){double(:list)}
  let(:dish1) {double("dish", dish: "Chinese", price: 7.5)}
  let(:dish2) {double("dish", dish: "Indian", price: 8.0)}


  describe "#select_item" do
    it 'allows for each food item to be selected' do
      order.select_item(dish1)
      expect(order.put_in_basket).to include dish1
    end


    it 'can choose a certain item' do
      order.select_item(dish1)
      expect(order.put_in_basket).to eq [dish1]
    end

    it 'can choose multiple items' do
      order.select_item(dish1)
      order.select_item(dish2)
      expect(order.put_in_basket).to eq [dish1, dish2]

    end

  end

end
