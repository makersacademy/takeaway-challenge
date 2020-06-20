require 'order'

describe Order do
  list =
  { 
    :"Vegetable Ramen" => 5,
    :"Crispy Tofu" => 4
  }
  
  describe '#show_list' do

    it 'displays all of the dishes and their prices' do
      expect(Order.new.show_list).to eq(list)
    end
  end

end