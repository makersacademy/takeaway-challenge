# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

require 'takeaway'

describe Takeaway do

  context 'with menu double' do
    let(:menu_double) { double :menu }
    let(:subject) { Takeaway.new(menu_double) }

    it 'gets a menu' do
      allow(menu_double).to receive(:display_menu) { { carbonara: 1.99 } }
      expect(subject.show_menu).to eq({ carbonara: 1.99 })
    end

  end

  context 'adding items' do
    let(:menu_double) { double(:menu, menu: { carbonara: 9.99 }) }
    let(:checkout_double) { double :checkout }
    let(:subject) { Takeaway.new(menu_double, checkout_double) }

    it 'returns error if given item not on menu' do
      expect { subject.add_to_order('fish', 1) }.to raise_error(RuntimeError, "Item isn't on the menu")
    end

    it 'does not return error if item on menu' do
      expect { subject.add_to_order("carbonara", 9.99) }.not_to raise_error("Item isn't on the menu")
    end

    it 'calls set_checkout on checkout' do
      allow(checkout_double).to receive(:set_checkout) { true }
      expect(subject.add_to_order("carbonara", 1)).to eq true
    end

  end

  context 'showing checkout and total' do
    let(:subject) { Takeaway.new }
    let(:sms) { double :notification }

    it 'shows checkout with total' do
      subject.add_to_order('carbonara', 2)
      expect { subject.show_order }.to output("Order:\n2x carbonara = £19.98\nTotal: £19.98\n").to_stdout
    end

  end

end

describe Checkout do
  let(:checkout) { Checkout.new }

  it 'has empty hash on startup' do
    expect(checkout.checkout).to be_empty
  end

  it 'adds item to checkout' do
    checkout.set_checkout(:test_dish, 10)
    expect(checkout.checkout).to eq({ test_dish: 10 })
  end

  it 'appends quantity to already existing key' do
    checkout.set_checkout(:test_dish, 10)
    checkout.set_checkout(:test_dish, 1)
    expect(checkout.checkout).to eq({ test_dish: 11 })
  end

  it 'adds second item to checkout' do
    checkout.set_checkout(:test_dish, 10)
    checkout.set_checkout(:test_dish, 1)
    checkout.set_checkout(:second_dish, 1)
    expect(checkout.checkout).to eq({ test_dish: 11, second_dish: 1 })
  end
end

describe Menu do

  it 'shows menu options' do
    expect { subject.display_menu }.to output("Menu Options:\nCarbonara: £9.99\nTurkey: £11\nOrange: £3\nBurrito: £3.99\n").to_stdout
  end

end
