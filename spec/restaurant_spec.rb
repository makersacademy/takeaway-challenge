require 'restaurant'

describe Restaurant do
  let(:subject) {described_class.new}
  let(:dish_a) {double(:dish, name: 'name_a', price: '050')}
  let(:dish_b) {double(:dish, name: 'name_b', price: '100')}
  let(:menu) {double(:menu, dishes: [dish_a, dish_b])}
  let(:basket) {double(:basket, dishes: [dish_b, dish_a], total: '1.50', add: nil)}

  it{is_expected.to respond_to(:show_menu)}
  it{is_expected.to respond_to(:show_basket)}
  it{is_expected.to respond_to(:select_item).with(1).argument}
  it{is_expected.to respond_to(:new_order)}

  before do
    allow($stdout).to receive(:write)
    subject.instance_variable_set("@menu", menu)
    subject.instance_variable_set("@basket", basket)
  end

  describe '#menu' do
    it 'has a menu' do
      expect(subject.menu).to eq  menu
    end
  end

  describe '#show_menu' do
    it 'asks menu for dishes' do
      expect(menu).to receive(:dishes)
      subject.show_menu
    end
  end

  describe '#show_basket' do
    it 'asks basket for dishes' do
      expect(basket).to receive(:dishes)
      subject.show_basket
    end
    it 'sends a total query to basket' do
      expect(basket).to receive(:total)
      subject.show_basket
    end
  end

  describe '#select_item' do
    it 'asks menu for dishes'do
      expect(menu).to receive(:dishes)
      subject.select_item('1')
    end
    it 'send the correct item to the basket' do
      expect(basket).to receive(:add).with(dish_a)
      subject.select_item('1')
    end
  end

    describe '#new_order' do
      it 'changes basket to be a new instance' do
        expect{subject.new_order}.to change{subject.basket}.to be_a(Basket)
      end
    end


end
