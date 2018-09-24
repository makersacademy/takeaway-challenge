require 'takeaway'

describe Takeaway do
  let(:menu) { described_class::MENU_LIST}
  let(:menu_item) { menu[0] }
  let(:order_added) { double :order_added, list: [menu_item] }
  let(:order) { double :order, total: 0 }
  let(:text) { double :text }
  let(:takeaway) { described_class.new(menu, order, text) }

  describe '#initialize'
    it 'initializes with order' do
      expect(takeaway.order).to eq order
    end

    it 'initializes with menu' do
      expect(takeaway.menu). to eq menu
    end

  describe '#see_menu'
    it { should respond_to(:see_menu) }

    it 'prints menu list' do
      menu.each do |dish|
        expect(STDOUT).to receive(:puts).with("Dish: #{dish[:name]}, price: #{dish[:price]}")
      end
      takeaway.see_menu
    end

  describe '#choose'
    it 'chooses the selected dish' do
      allow(order).to receive(:add) { takeaway.order = order_added }
      takeaway.choose(menu_item[:name])
      expect(takeaway.order.list).to eq [menu_item]
    end

    it 'raises an error if ordered dish does not exist' do
      expect { takeaway.choose('Worms') }.to raise_error 'Sorry, we do not have this dish.'
    end

  describe 'print_order'
    it 'prints current order' do
      allow(order).to receive(:list) { [{name: menu_item[:name], price: menu_item[:price], amount: 1}] }
      expect(STDOUT).to receive(:puts).with("Dish: #{menu_item[:name]}, price: #{menu_item[:price]}, amount: 1")
      takeaway.print_order
    end

  describe 'check_total'
    it 'prints current order and calculated total so that customer can check' do
      allow(order).to receive(:list) { [{name: menu_item[:name], price: menu_item[:price], amount: 1}] }
      allow(order).to receive(:total) { 6 }
      expect(STDOUT).to receive(:puts).with("You have ordered: ")
      expect(STDOUT).to receive(:puts).with("Dish: #{menu_item[:name]}, price: #{menu_item[:price]}, amount: 1")
      expect(STDOUT).to receive(:puts).with("The calculated total is 6")
      takeaway.check_total
    end

  describe 'place_order'
    it 'checks total' do
      allow(takeaway).to receive(:place_order?) {nil} #switches off place_order? so that test doesn't ask for user input
      expect(takeaway).to receive(:check_total)
      takeaway.place_order
    end

    it 'sends text if user wants to place order' do
      allow(takeaway).to receive(:check_total) { nil }
      allow(takeaway).to receive(:place_order?) { true }
      allow(text).to receive(:send).with(an_instance_of(Numeric))
      expect(takeaway.text).to receive(:send)
      takeaway.place_order
    end

    it 'informs user that order has not been placed when it has not' do
      allow(takeaway).to receive(:check_total) { nil }
      allow(takeaway).to receive(:place_order?) { false }
      expect(STDOUT).to receive(:puts).with("Your order has not been placed")
      takeaway.place_order
    end

  describe 'place_order?'
    it 'return true when user answers y' do
      $stdin = StringIO.new('y')
      expect(takeaway.place_order?).to eq true
    end

end
