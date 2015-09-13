require 'order'

describe Order do 

  it { is_expected.to respond_to(:add_item).with(2).arguments }
  it { is_expected.to respond_to(:remove_item).with(2).argument }
  it { is_expected.to respond_to(:check_dishes) }
  it { is_expected.to respond_to(:basket) }
  it { is_expected.to respond_to(:place_order) }
  

  it 'should be able to check the list of dishes with prices' do
    expect(subject.check_dishes).to be_truthy
  end 

  it 'should have the initial total as 0' do 
    expect(subject.total).to eq(0.0)
  end


  context 'Adding items' do 

    it 'should be able to add a dish to the basket' do
      subject.add_item("Duck Pancakes")
      expect(subject.basket.include?("Duck Pancakes")).to be(true)
    end

    it 'should increase the total price correctly after adding an item' do
      subject.add_item("Duck Pancakes")
      expect(subject.total).to eq(4.99)
    end

    it 'should not be able to add items not on the menu' do 
      expect{ subject.add_item("Chicken Korma") }.to raise_error 'That item is not on the menu'
    end

    it 'should add to the quantity if the same item is added more than once' do
      subject.add_item("Duck Pancakes")
      subject.add_item("Duck Pancakes", 3)
      expect(subject.basket["Duck Pancakes"]).to eq(4)
    end

  end

  context 'Removing items' do

    it 'should be able to remove an item from the basket' do
      subject.add_item("Duck Pancakes")
      subject.remove_item("Duck Pancakes")
      expect(subject.basket.empty?).to eq(true)
    end

    it 'should not be able to remove an item not in the basket' do
      subject.add_item("Duck Pancakes")
      expect{ subject.remove_item("Egg Fried Rice") }.to raise_error 'Item was not in the basket'
    end

    it 'should decrease the total price accordingly if an item is removed' do
      subject.add_item("Duck Pancakes")
      subject.remove_item("Duck Pancakes")
      expect(subject.total).to eq(0)
    end

    it 'should not be able to remove more items than there are in the basket' do 
      subject.add_item("Duck Pancakes")
      expect{ subject.remove_item("Duck Pancakes", 2) }.to raise_error 'You do not have that quantity of the item in the basket'
    end

  end

  it 'should check the total is equal to the sum of the prices of the items in the basket' do
    subject.add_item("Duck Pancakes", 3)
    subject.add_item("Crispy Beef", 4)
    subject.remove_item("Crispy Beef", 2)
    expect(subject.total_price_verified?).to eq(true)
  end

end