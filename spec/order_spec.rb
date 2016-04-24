require 'order'
describe Order do
  let(:list_dishes) { { "jamon serrano": 15.99, "croquetas gato": 7.99, "tortilla patata": 4.99, "spanish sangria": 7.25 } }
  let(:menu) { double :menu, dishes: list_dishes, price: '€1.00', contains?: true }
  let(:takeaway) { double :takeaway, complete_order: true}
  subject(:order) {described_class.new(takeaway, menu)}
  context('when initializing') do
    it 'basket is empty' do
      expect(order.basket).to be_empty
    end

    it '#total is 0€' do
      expect(order.total).to eq "Total: 0.0€"
    end

    it 'contains a menu' do
      expect(order.menu.dishes).to include :"jamon serrano"
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

      it 'returns the correct mesage for a quick checkout' do
        output = "1 x spanish sangria added to your basket. Thank you! Your order has been processed. Confirmation SMS sent."
        expect(order.add("spanish sangria",1,7.25)).to eq output
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

  context('#basket_summary') do
    it 'returns "basket is empty" if basket empty' do
      order.basket_summary
      expect(order.basket_summary).to eq ("basket is empty")
    end

    it 'returns "jamon serrano" when 1xjamon in basket' do
      order.add("jamon serrano")
      order.basket_summary
      expect(order.basket_summary).to eq ("jamon serrano x 1 = €15.99, ")
    end
  end

  context('#total') do
    it 'returns 29Eur for 4 spanish sangrias ' do
      order.add("spanish sangria", 4)
      expect(order.total).to eq "Total: 29.0€"
    end

    it 'returns 53.45 Eur for 1 croquetas 1 jamon 3 tortillas and 2 sangrias ' do
      order.add("croquetas gato")
      order.add("jamon serrano")
      order.add("tortilla patata", 3)
      order.add("spanish sangria", 2)
      expect(order.total).to eq "Total: 53.45€"
    end
  end

  context('#checkout') do

    it 'raises error if basket empty' do
      expect{ order.checkout(5) }.to raise_error "nothing on basket"
    end

    it 'launches process order in takeaway' do
      order.add("jamon serrano")
      expect(takeaway).to receive(:complete_order)
      takeaway.complete_order
    end
  end

  context('#clean_up') do
    it 'empties basket' do
      order.add("croquetas gato",5)
      order.clean_up
      expect(order.basket).to be_empty
    end

    it 'empties total bill' do
      order.add("jamon serrano",2)
      order.add("spanish sangria",3)
      order.clean_up
      expect(order.bill).to eq 0
    end
  end
end