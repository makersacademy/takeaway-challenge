require 'order'
describe Order do
  let(:list_dishes) { { "jamon serrano": 15.99, "croquetas gato": 7.99, "tortilla patata": 4.99, "spanish sangria": 7.25 } }
  let(:menu) { double :menu, dishes: list_dishes, price: '€1.00', contains?: true }
  subject(:order) {described_class.new}
  context('when initializing') do
    it 'basket is empty' do
      expect(order.basket).to be_empty
    end

    it '#complete? is false' do
      expect(order.complete?).to be false
    end

    it 'receives a menu object' do
      expect(order.menu).to be_an_instance_of Menu
    end
  end

  context('#add') do
    describe 'message formatting' do
      it 'returns the correct message for dish jamon serrano' do
        output = "1 x jamon serrano added to your basket."
        expect(order.add("jamon serrano")).to eq output
      end

      it 'returns the correct message for dish 2 x croquetas gato' do
        output = "2 x croquetas gato added to your basket."
        expect(order.add("croquetas gato",2)).to eq output
      end
    end

    describe ' adding to basket' do
      it 'adds to basket 1 jamon serrano, when chosen so' do
        order.add("jamon serrano")
        expect(order.basket).to eq({ "jamon serrano": 1 })
      end

      it 'adds to basket 2 spanish sangria, when chose so' do
        order.add("spanish sangria", 2)
        expect(order.basket).to eq({ "spanish sangria": 2 })
      end

      it 'adds to basket 1 spanish sangria, then another one, it should have 2' do
        order.add("spanish sangria")
        order.add("spanish sangria")
        expect(order.basket).to eq({ "spanish sangria": 2 })
      end
    end
  end

  context('#checkout') do
    it 'changes status order to ready to be processed' do
      order.add("jamon serrano")
      order.checkout
      expect(order.ready_to_process).to be true
    end
  end

  context('#basket_summary') do
    it 'returns "basket is empty" if basket empty' do
      order.basket_summary
      expect(order.basket_summary).to eq ("basket is empty")
    end

    it 'returns "jamon serrano" when 1xjamon in basket' do
      order.add("jamon serrano")
      p order.basket
      order.basket_summary
      expect(order.basket_summary).to eq ("jamon serrano x 1 = €15.99, ")
    end
  end
end