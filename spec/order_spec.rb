require 'order'

describe Order do
  let(:pasta) { double :pasta }
  let(:paneer_tikka_masala) { double :paneer_tikka_masala}
  let(:pizza) { double :pizza}
  let(:dish) { double(:dish, name: paneer_tikka_masala, price: 10) }
  let(:new_dish) { double(:new_dish, name: pizza, price: 15) }
  let(:menu) { double(:menu, menu: [dish, new_dish])}
  
  it 'raises error if you attempt to delete an item from the basket, which is not in the basket' do
    expect {subject.remove_dish_from_basket(paneer_tikka_masala) }.to raise_error "This dish is not currently in your basket"
  end

  it 'outputs "Your basket is empty if you attempt to calculate the cost of an empty basket' do
    expect { subject.calculate_order_price }.to output("Your basket is empty\n").to_stdout
  end

  context 'with mocking menu class' do

    before do
      allow(Menu).to receive(:new).and_return(menu)
    end

    it 'can select a main dish from the menu and store them in my basket' do
      expect {subject.add_dish_to_basket(paneer_tikka_masala) }.to change { subject.basket }.from([]).to([dish])
    end

    it 'will raise an error should you try to add an item not on the menu' do
      expect {subject.add_dish_to_basket(pasta) }.to raise_error 'There is no such dish on the menu'
    end

    context 'and adding paneer and pizza doubles to basket' do

      before do
        subject.add_dish_to_basket(paneer_tikka_masala)
        subject.add_dish_to_basket(pizza)
      end

      it 'can select a main dish from the basket and remove it' do
        expect {subject.remove_dish_from_basket(paneer_tikka_masala) }.to change { subject.basket }.from([dish, new_dish]).to([new_dish])
      end

      it 'complete order should empty the basket' do
        expect { subject.complete_order }.to change { subject.basket }.from([dish, new_dish]).to([])
      end

      it 'should calculate the cost of the order as £25' do
        expect(subject.calculate_order_price).to eq(25)
      end

    end

  end

end