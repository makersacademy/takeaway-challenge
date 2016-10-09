require 'menu'

describe Menu do

  subject(:menu) {described_class.new}
  let(:dish1) {double("dish", dish: "Chinese", price: 7.5)}
  # let(:price) {double :price}

  describe "#initialize" do

    it 'checks to make sure the hash is not empty' do
      expect(menu.full_list).not_to be_empty
    end
    
  end

  describe "#full_list" do

    it 'display list of orderable items' do
      expect{menu.full_list}.to output.to_stdout
    end

    it 'shows the price of each item' do
      expect(dish1.price).to eq 7.5
    end
  end

  describe "#on_list?" do

    it 'returns an error if order item is not on the list' do
      item = "input"
      expect{menu.on_list?(dish1)}.to raise_error "Choice not availble"
    end

  end


end
