require 'order'

describe Order do

  let(:green_curry) {double("Green Curry", name: "Green Curry", price: 5)}
  let(:pad_thai) {double("Pad Thai", name: "Pad Thai", price: 6)}
  let(:penang_curry) {double(name: "Penang Curry", price: 7)}

  let(:cod_and_chips) {double("Cod and Chips", name: "Cod and Chips", price: 4)}
  let(:saveloy) {double("Saveloy", name: "Saveloy", price: 1.5)}
  let(:mushy_peas) {double("Mushy Peas", name: "Mushy Peas", price: 0.5)}

  let(:thai_dishes) {double(list: [green_curry, pad_thai, penang_curry])}
  let(:chippy_list) {double(list: [cod_and_chips, saveloy, mushy_peas])}

  let(:sms_sender) {double(send_sms: true)}
  let(:notification) {double("Notification", new: sms_sender )}

  subject(:order) {create_order(dishes: thai_dishes)}

  describe '#initialize' do

    it 'initializes with a dishes list in it' do
      expect(order.dishes).to eq thai_dishes
    end

  end

  describe '#load_list()' do

    it 'can accept new DishesLists' do
      order.load_list(chippy_list)
      expect(order.show_available_dishes).to eq chippy_list.list
    end

  end

  describe '#show_available_dishes' do

    it 'shows a list of available dishes' do
      expect(order.show_available_dishes).to eq thai_dishes.list
    end

    it 'shows the names of the dishes' do
      first_dish = order.show_available_dishes[0]
      expect(first_dish.name).to eq "Green Curry"
    end

    it 'shows the prices of the dishes' do
      first_dish = order.show_available_dishes[0]
      expect(first_dish.price).to eq 5
    end

  end

  describe '#add_to_current()' do

    it 'adds a dish to the current order' do
      order.add_to_current("Pad Thai")
      expect(order.current[0][:dish]).to be pad_thai
    end

    it 'adds multiple of the same dish to the current order' do
      order.add_to_current("Pad Thai", 2)
      expect(order.current[0][:quantity]).to be 2
    end

    it 'defaults to 1 item if you don\'t tell it how many to add' do
      order.add_to_current("Pad Thai")
      expect(order.current[0][:quantity]).to be 1
    end

    it 'sums quantity for similar items even if you add them separately' do
      2.times { order.add_to_current("Pad Thai") }
      expect(order.current[0][:quantity]).to be 2
    end

  end

  describe '#total' do

    it 'shows a total of the items in the current order' do
      order.add_to_current("Green Curry")
      order.add_to_current("Penang Curry")
      expect(order.total).to eq green_curry.price + penang_curry.price
    end

  end

  describe '#complete' do

    it "clears the current order" do
      order.add_to_current("Green Curry")
      order.complete(notification)
      expect(order.current).to be_empty
    end

  end

end

def create_order(arguments)
  dishes = arguments[:dishes] ||= nil
  Order.new(dishes)
end
