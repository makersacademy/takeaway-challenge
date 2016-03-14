require 'controller'

describe Controller do
  subject(:test_controller) {described_class.new dummy_menu , dummy_order_class, dummy_twilio_class}
  let(:dummy_menu) {double :menu, list_dishes: nil, retrieve_dishes: [dummy_dish]}
  let(:dummy_order_class) {double :Order, new: dummy_order}
  let(:dummy_order) {double :order, add_dish: nil, update_total: nil, total_bill: 0}
  let(:dummy_dish) {double :dish}

  let(:dummy_twilio_class) {double :Client, new: dummy_twilio}
  let(:dummy_twilio) {double :client, account: dummy_account}
  let(:dummy_account) {double :account, messages: dummy_messages}
  let(:dummy_messages) {double :messages, create: nil}

  describe '#welcome' do

      it 'expects to return a welcome message to the user' do
        expect(test_controller.welcome).to eq described_class::WELCOME_MESSAGE
      end

      it 'expect to create a new active order' do
        expect(test_controller).to receive(:setup_new_order)
        test_controller.welcome
      end
  end

  describe '#list_dishes' do

    it 'calls the function on menu' do
      expect(dummy_menu).to receive(:list_dishes)
      test_controller.list_dishes
    end

  end

  describe '#add_dish' do

    before(:each) do
      test_controller.welcome
    end

    it 'add the order to the list' do
      expect(dummy_order).to receive(:add_dish).with dummy_dish , 1
      test_controller.add_dish 1
    end

    it 'update the total due' do
      expect(dummy_order).to receive :update_total
      test_controller.add_dish 1
    end

  end

  describe '#checkout' do

    before(:each) do
      test_controller.welcome
    end

    it 'checks the payment against the total' do
      expect(dummy_order).to receive :total_bill
      test_controller.checkout 0
    end

    it 'raises an error if the payment is incorrect' do
      expect{test_controller.checkout 1}.to raise_error described_class::PAYMENT_ERROR
    end

    it 'raises an error if trying to pay twice (you dummy)' do
      test_controller.checkout 0
      expect{test_controller.checkout 0}.to raise_error described_class::ALREADY_PAID
    end

    it 'sends the confirmation text' do
      expect(dummy_messages).to receive(:create)
      test_controller.checkout 0
    end

  end

end
