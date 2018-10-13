require 'order'

describe Order do
subject(:order) { Order.new(menu) }
let(:menu) { instance_double Menu, dishes: [kungpaochicken, beeflomein, shanghaidumplings] }
let(:kungpaochicken) { instance_double Dish, dish_name: 'kungpaochicken', price: 3 }
let(:beeflomein) { instance_double Dish, dish_name: 'beeflomein', price: 2 }
let(:shanghaidumplings) { instance_double Dish, dish_name: 'shanghaidumplings', price: 1 }
let(:dish_off_menu) { instance_double Dish, dish_name: 'not on menu', price: 0 }


  describe '#initialize' do
    it 'defaults with an empty basket' do
      expect(subject.basket).to be_empty
    end
  end

  describe '#add' do
    it 'should not add dishes to @basket that are not on @menu' do
      expect { subject.add(dish_off_menu) }.to raise_error "Sorry, #{dish_off_menu} is not on our menu."
    end
    it 'adds dishes to @basket that are on the @menu' do
      subject.add(kungpaochicken)
      expect(subject.basket).to eq [{dish: kungpaochicken, amount: 1}]
    end
    it 'adds multiple dishes if amount varies' do
      subject.add(kungpaochicken, 3)
      expect(subject.basket).to eq [{dish: kungpaochicken, amount: 3}]
    end
  end

  # describe '#remove' do
  #   it 'should raise a message if dish not in @basket' do
  #     expect { subject.remove(kungpaochicken) }.to raise_error "#{kungpaochicken} is not in your basket"
  #   end
    # it 'should remove a dish if it is in the @basket' do
    #   subject.add(kungpaochicken)
    #   subject.remove(kungpaochicken)
    #   expect(subject.basket).to be_empty
    # end
  # end

  describe '#wipe_basket' do
    it 'empties @basket' do
      subject.add(kungpaochicken, 3)
      expect(subject.wipe_basket).to be_empty
    end
  end

  describe '#list' do
    it 'throws an error message if @basket is empty' do
      expect { subject.list_basket }.to raise_error 'Basket is empty'
    end
    it 'prints dishes with amount in @basket' do
      subject.add(kungpaochicken, 5)
      subject.add(beeflomein, 2)
      subject.add(shanghaidumplings, 3)
      order_list = "5 portions of kungpaochicken\n2 portions of beeflomein\n3 portions of shanghaidumplings\n"
      expect { subject.list_basket }.to output(order_list).to_stdout
    end
  end

  describe '#total' do
    it 'should return the total cost for a full order' do
      subject.add(kungpaochicken, 2)
      subject.add(beeflomein, 2)
      subject.add(shanghaidumplings, 2)
      expect(subject.total).to eq 12
    end
  end


end
