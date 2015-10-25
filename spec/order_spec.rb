require 'order'

describe Order do

  let(:new_dish) { {name: "pizza", quantity: 2, price: 14, accumulated_prize: 28} }
  let(:new_dish2) { {name: "not_included_dish", quantity: 1, price: 14, accumulated_price: 14} }

  describe '#initialize' do
  	it 'is expected to start with an empty basket' do
  	  expect(subject.basket).to be_empty
  	end
  end

  describe '#add' do
  	it {is_expected.to respond_to(:add).with(2).argument}

  	it 'adds the dish to the basket' do
  	  subject.add("pizza", 2)
  	  expect(subject.basket).to include new_dish
  	end

  	it 'is not included in the menu, so it is not added the dish to the basket' do
  	  subject.add("not_included_dish")
  	  expect(subject.basket).to_not include new_dish2
  	end
  end

  describe '#not_update_basket' do
  	it 'is not included in the menu, so it returns a message' do
  	  subject.add("not_included_dish")
  	  expect(subject.not_update_basket).to eq "We don't have it in the menu."
  	end
  end

  describe '#update_basket' do
	it 'if including 2 times the same dish, the first one is excluded' do
	  subject.add("pizza", 2)
	  subject.add("pizza", 4)
  	  expect(subject.basket).to_not include new_dish
	end
  end

  describe '#available_menu' do
	it 'dish is not included in the menu' do
	  subject.add("not_included_dish")
  	  expect(subject.available_menu).to be false
	end

	it 'dish is included in the menu' do
	  subject.add("classic burger")
  	  expect(subject.available_menu).to be true
	end
  end

  describe '#total' do
	it 'returns the total price of the current order' do
	  subject.add("pizza", 2)
	  subject.add("classic burger")
	  expect(subject.total).to eq 39
	end
  end

  describe '#checkout' do
	it 'returns the purchase' do
	  subject.add("salad")
	  expect(subject.checkout(25)).to eq "The amount is not correct"
	end

	it 'returns the purchase' do
	  subject.add("pizza")
	  expect(subject.checkout(14)).to eq "your order has been placed"
	end

  end


end