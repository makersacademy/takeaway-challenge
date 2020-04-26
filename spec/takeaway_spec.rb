require 'takeaway'

describe Order do

  let(:menu) { [{ item: "Chips", price: 0.99 },
              { item: "Ham Sandwhich", price: 1.49 },
              { item: "Curry and Rice", price: 3.99 },
              { item: "Fried Chicken", price: 2.79 },
              { item: "Pizza", price: 2.99 }] 
  }

  describe 'current order' do
    it 'has empty array, length 5' do
      expect(subject.current_order).to eq([0, 0, 0, 0, 0])
    end
  end

  describe '.menu' do

    it 'is an array, length 5' do
      expect(subject.menu.length).to eq 5

    end

    it 'has chips which cost £0.99' do
      expect(subject.menu[0][:item]).to eq "Chips"
      expect(subject.menu[0][:price]).to eq 0.99
    end

    it 'has ham sandwhich which cost £1.49' do
      expect(subject.menu[1][:item]).to eq "Ham Sandwhich"
      expect(subject.menu[1][:price]).to eq 1.49
    end

    it 'has curry and rice which costs £3.99' do
      expect(subject.menu[2][:item]).to eq "Curry and Rice"
      expect(subject.menu[2][:price]).to eq 3.99
    end

    it 'has fried chicken which costs £2.79' do
      expect(subject.menu[3][:item]).to eq "Fried Chicken"
      expect(subject.menu[3][:price]).to eq 2.79
    end

    it 'has pizza which costs £2.99' do
      expect(subject.menu[4][:item]).to eq "Pizza"
      expect(subject.menu[4][:price]).to eq 2.99
    end
  end

  describe '.view_menu' do

    it 'puts the menu and opener' do
      expect { subject.view_menu(menu) }.to output("Which item would you like to order?\n1: Chips: £0.99\n2: Ham Sandwhich: £1.49\n3: Curry and Rice: £3.99\n4: Fried Chicken: £2.79\n5: Pizza: £2.99\n").to_stdout
    end
  end

  describe '.add' do

    it "adds items to current_order" do
      subject.add(1, 3)
      subject.add(2, 5)
      subject.add(3, 2)
      subject.add(4, 5)
      subject.add(5, 2)
      expect(subject.current_order).to eq([3, 5, 2, 5, 2])
    end

    it 'wont add non existent items to array' do
      expect { subject.add(0, 1) }.to output("Try again\n").to_stdout
      expect { subject.add(6, 1) }.to output("Try again\n").to_stdout
      expect(subject.current_order).to eq([0, 0, 0, 0, 0])
    end
  end

  describe '.total' do

    it 'adds current_order total' do
      subject.add(1, 3)
      subject.add(2, 5)
      subject.add(3, 2)
      subject.add(4, 5)
      subject.add(5, 2)
      expect(subject.total).to eq(38.33)
    end
  end

  describe '.checkout' do

    it 'returns false if no order made' do
      expect(subject.checkout).to eq false
    end

    it 'returns true if order made and text sent' do
      subject.add(1, 3)
      expect(subject.checkout).to eq true
    end
  end
end
