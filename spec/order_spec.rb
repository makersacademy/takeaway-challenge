require 'order'

describe Order do 

  # let(:menu) { double :menu }

  it { is_expected.to respond_to(:add_item).with(2).arguments }
  it { is_expected.to respond_to(:remove_item).with(2).argument }
  it { is_expected.to respond_to(:check_dishes).with(1).argument }
  it { is_expected.to respond_to(:basket) }
  

  it 'should be able to check the list of dishes with prices' do
    menu = Menu.new
    expect(subject.check_dishes(menu)).to be_truthy
  end 

  it 'should be able to add a dish to the basket' do
    menu = Menu.new
    subject.add_item(menu, "Duck Pancakes")
    expect(subject.basket.include?("Duck Pancakes")).to be(true)
  end

  it 'should increase the total price correctly after adding an item' do
    menu = Menu.new
    subject.add_item(menu, "Duck Pancakes")
    expect(subject.total).to eq(4.99)
  end

  it 'should have the initial total as 0' do 
    expect(subject.total).to eq(0.0)
  end

  it 'should not be able to order items not on the menu' do 
    menu = Menu.new
    expect{ subject.add_item(menu, "Chicken Korma") }.to raise_error 'That item is not on the menu'
  end

  it 'should be able to remove an item from the basket' do
    menu = Menu.new
    subject.add_item(menu, "Duck Pancakes")
    subject.remove_item(menu, "Duck Pancakes")
    expect(subject.basket.empty?).to eq(true)
  end

  it 'should not be able to remove an item not in the basket' do
    menu = Menu.new
    subject.add_item(menu, "Duck Pancakes")
    expect{ subject.remove_item(menu, "Egg Fried Rice") }.to raise_error 'Item was not in the basket'
  end

  it 'should decrease the total price accordingly if an item is removed' do
    menu = Menu.new
    subject.add_item(menu, "Duck Pancakes")
    subject.remove_item(menu, "Duck Pancakes")
    expect(subject.total).to eq(0)
  end

end