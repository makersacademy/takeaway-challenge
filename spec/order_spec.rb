require 'order'

describe Order do

  describe '#add_to_order' do

    it 'store dish and quantity in the order' do

      subject.add_to_order("Apple Pie",3)
      subject.add_to_order("Tiramisu", 4)
      expect(subject.dishes_ordered).to eq ({ "Apple Pie" => 3, "Tiramisu" => 4 })

    end

  end

end
