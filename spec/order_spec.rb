require 'order'
describe Order do
  let(:list_dishes) { { "jamon serrano": 15.99, "croquetas gato": 7.99, "tortilla patata": 4.99, "spanish sangria": 7.25 } }
  let(:menu) { double :menu, dishes: list_dishes, price: '€1.00', contains?: true }
  let(:person) {double :person, name: "Pepito", phone: "123456789"}
  subject(:order) {described_class.new}
  context('when initializing') do
    it 'basket is empty' do
      expect(order.basket).to be_empty
    end

    it 'receives a menu object' do
      expect(order.menu).to be_an_instance_of Menu
    end

    it 'receives a person object' do
      expect(order.person).to be_an_instance_of Person
    end
  end

  context('#add') do
    it 'returns the correct message for dish jamon serrano' do
      expect(order.add("jamon serrano")).to eq "1 x jamon serrano added to your basket."
    end

    it 'returns the correct message for dish 2 x croquetas gato' do
      expect(order.add("croquetas gato",2)).to eq "2 x croquetas gato added to your basket"
    end
  end
end