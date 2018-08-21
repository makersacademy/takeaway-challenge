require 'order'

describe Order do 
subject(:order) { Order.new(menu) }
let(:menu) { instance_double Menu, dishes: [pie, mash, peas] } 
let(:pie) { instance_double Dish, name: 'pie', price: 3 }
let(:mash) { instance_double Dish, name: 'mash', price: 2 }
let(:peas) { instance_double Dish, name: 'peas', price: 1 }
let(:dish_off_menu) { instance_double Dish, name: 'Not on menu', price: 0 }


  describe '#initialize' do 
    it 'defaults with an empty basket' do 
      expect(subject.basket).to be_empty
    end
  end

  describe '#add' do 
    it 'should not add dishes to @basket that are not on @menu' do 
      expect { subject.add(dish_off_menu) }.to raise_error "#{dish_off_menu} is off the menu"
    end
    it 'adds dishes to @basket that are on the @menu' do 
      subject.add(pie)
      expect(subject.basket).to eq [{dish: pie, amount: 1}] 
    end  
    it 'adds multiple dishes if amount varies' do 
      subject.add(pie, 3)
      expect(subject.basket).to eq [{dish: pie, amount: 3}]
    end
  end

  describe '#remove' do 
    it 'should raise a message if dish not in @basket' do 
      expect { subject.remove(pie) }.to raise_error "#{pie} is not in your basket"
    end
    # it 'should remove a dish if it is in the @basket' do 
    #   subject.add(pie)
    #   subject.remove(pie)
    #   expect(subject.basket).to be_empty
    # end
  end

  describe '#list' do 
    it 'throws an error message if @basket is empty' do 
      expect { subject.list }.to raise_error 'Basket is empty'
    end
    it 'prints dishes with amount in @basket' do 
      subject.add(pie, 5)
      subject.add(mash, 2)
      subject.add(peas, 3)
      order_list = "5 x pie\n2 x mash\n3 x peas\n"
      expect { subject.list }.to output(order_list).to_stdout
    end
  end

  describe '#total' do 
    it 'should return the total cost for a full order' do 
      subject.add(pie, 2)
      subject.add(mash, 2)
      subject.add(peas, 2)
      expect(subject.total).to eq 12
    end
  end

  
end
