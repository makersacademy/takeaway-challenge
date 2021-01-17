require 'order'

describe Order do

  describe '#add_dish' do

    let(:dish) { double("dish") }

    before :each do
      allow(dish).to receive(:[]).with("id").and_return(1)
    end
    
    it 'Checks if one dish has been added to the array' do
      allow(subject).to receive(:find_by_id).with(subject.dishes, 1).and_return(nil)
      expect(dish).to receive(:[]=).with("quantity", Order::MINIMUM_QUANTITY)
      subject.add_dish(dish)

      expect(subject.dishes).to include(dish)
    end

    it 'Checks if more than one dish has been added to the array' do
      allow(subject).to receive(:find_by_id).with(subject.dishes, 1).and_return(nil)
      expect(dish).to receive(:[]=).with("quantity", 5)
      subject.add_dish(dish, 5)

      expect(subject.dishes).to include(dish)
    end

    it 'Updates dish quantity if the same dish is entered twice' do
      allow(subject).to receive(:find_by_id).with(subject.dishes, 1).and_return(nil)
      expect(dish).to receive(:[]=).with("quantity", Order::MINIMUM_QUANTITY)
      subject.add_dish(dish)

      allow(subject).to receive(:find_by_id).with(subject.dishes, 1).and_return(dish)
      allow(dish).to receive(:[]).with("quantity").and_return(Order::MINIMUM_QUANTITY)
      expect(dish).to receive(:[]=).with("quantity", Order::MINIMUM_QUANTITY * 2)
      subject.add_dish(dish)

      expect(subject.dishes).to include(dish)
    end

  end

  describe "#order_total" do

    let(:dish1) { double("dish1") }
    let(:dish2) { double("dish2") }

    it 'return total amount' do
      subject.dishes = [dish1, dish2]
      
      allow(dish1).to receive(:[]).with("price").and_return(3)
      allow(dish1).to receive(:[]).with("quantity").and_return(2)

      allow(dish2).to receive(:[]).with("price").and_return(2)
      allow(dish2).to receive(:[]).with("quantity").and_return(1)

      expect(subject.order_total).to eq 8
    end

  end

end
