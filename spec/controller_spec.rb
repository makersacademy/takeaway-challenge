require 'controller'

describe Controller do
  subject(:test_controller) {described_class.new dummy_menu , dummy_order_class}
  let(:dummy_menu) {double :menu, list_dishes: nil}
  let(:dummy_order_class) {double :Order, new: dummy_order}
  let(:dummy_order) {double :order, add_dish: nil, update_total: nil, bill: 0}
  let(:dummy_dish) {double :dish}

  describe '#initialize' do

    it 'is initalized with a menu of the day' do
      expect(test_controller.menu).to eq dummy_menu
    end

    it 'is initalized with a order class' do
      expect(test_controller.order_class).to eq dummy_order_class
    end

    it 'set the twilio interface up' do
      expect(test_controller).to receive(:setup_twilio)
      test_controller = described_class.new
    end

  end

  describe '#welcome' do

      it 'expects to return a welcome message to the user' do
        expect(test_controller.welcome).to eq described_class::WELCOME_MESSAGE
      end

      it 'expect to create a new active order' do
        expect(test_controller.current_order.class).not_to eq nil
      end
  end

  describe '#list_dishes' do

    it 'calls the function on menu' do
      expect(dummy_menu).to receive(:list_dishes)
      test_controller.list_dishes
    end

  end

  describe '#update_order' do

    before(:each) do
      test_controller.welcome
    end

    it 'add the order to the list' do
      expect(dummy_order).to receive(:add_dish).with(dummy_dish, 1)
      test_controller.update_order dummy_dish
    end

    it 'update the total due' do
      expect(dummy_order).to receive(:update_total)
      test_controller.update_order dummy_dish
    end

  end

  describe '#checkout' do

    before(:each) do
      test_controller.welcome
    end

    it 'checks the payment against the total' do
      expect(dummy_order).to receive(:bill)
      test_controller.checkout 0
    end

    it 'raises an error if the payment is incorrect' do
      expect {test_controller.checkout 1}.to raise_error(described_class::PAYMENT_ERROR)
    end

    xit 'sends the confirmation text' do
      #todo:stubbing
    end

  end

end
