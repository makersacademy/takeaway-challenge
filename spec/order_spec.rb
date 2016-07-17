require 'order'

describe Order do
  let(:menu){double :menu, :dish_list => {"pizza"=>3}}

  context 'ordering dish'do
    it 'adds dish to order' do
      subject.add_to_order("pizza",2)
      expect(subject.basket).to eq "pizza" => 2
    end
    it 'updates the quantity value of existing food' do
      subject.add_to_order("burger",2)
      subject.add_to_order("burger",4)
      expect(subject.basket).to eq "burger" => 6
    end
    it 'sets quantity to 1 by default' do
      subject.add_to_order("chips")
      expect(subject.basket).to eq "chips" => 1
    end
    it 'raises an error when dish not on menu' do
      expect{subject.add_to_order("cheese")}.to raise_error 'No such dish on menu'
    end
  end

  context 'order total' do
    it 'calculates current total' do
      subject.add_to_order("pizza")
      expect(subject.current_total).to eq 3
    end
    it 'calculates total' do
      subject.add_to_order("pizza",5)
      expect(subject.current_total).to eq 15
    end
  end

end
