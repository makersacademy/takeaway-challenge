require 'takeaway'

describe TakeAway do
  let(:list_dishes) { { "jamon serrano": 15.99, "croquetas gato": 7.99, "tortilla patata": 4.99, "spanish sangria": 7.25 } }
  let(:basket) { {"jamon serrano": 1, "croquetas gato": 2} }
  let(:basket_wrong_price) { {"jamon serrano": 2, "croquetas gato": 1, "tortilla patata": 1} }
  let(:menu) { double :menu, dishes: list_dishes, contains?: true }
  let(:messager) { double :messager }
  let(:order) { double :order, menu: menu, dishes: list_dishes, basket: basket, customer_price: 31.97, bill: 31.97}
  let(:wrong_order) { double :order, menu: menu, dishes: list_dishes, basket: basket_wrong_price, bill: 44.96, customer_price: 3.25 }
  subject(:takeaway) {described_class.new(messager)}
  let(:takeaway_fail) { described_class.new(messager) }

  context 'on initializing' do

    it 'takes a messager object' do
      expect(takeaway).to respond_to(:messager)
    end

    it 'takes an order object' do
      expect(takeaway).to respond_to(:order)
    end
  end

  context '#complete_order' do
    it 'fails if price is not correct' do
      output ="order price not correct, please review"
      expect { takeaway_fail.complete_order(1,3) }.to raise_error output
    end
  end

end