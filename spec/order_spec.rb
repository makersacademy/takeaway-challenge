require 'order'

describe Order do

  let(:name) { "Hash brown" }
  let(:quantity) { 3 }

  context 'making an order' do
    it 'can create an order' do
      expect(subject.my_order).to eq([]) 
    end

    it 'add a #dish and specify a #quantity' do 
      subject.add_dish_to_order(name, quantity)
      expect(subject.my_order).to eq([{ "Hash brown" => 3 }])
    end 
  end
end
