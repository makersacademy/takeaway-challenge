require 'takeaway'

describe TakeAway do

  let(:menu_class) { double(:menu_class) }
  let(:menu) { double(:menu) }
  let(:basket) { double(:basket) }
  let(:dish) { double(:dish) }
  let(:phone_number) { double(:phone_number) }
  let(:messager) { double(:messager) }
  let(:subject) { described_class.new(menu_class, menu, basket) }

  describe '#read_menu' do

    it 'reads the menu object' do
      expect(menu).to receive(:read)
      subject.read_menu
    end

  end

  describe '#add_to_basket' do

    it 'adds an item to the basket' do
      expect(basket).to receive(:add).with(dish)
      subject.add_to_basket(dish)
    end

  end

  describe '#view_basket' do

    it 'displays the basket' do
      expect(basket).to receive(:view)
      subject.view_basket
    end

  end

  describe '#complete_order' do

    before do
      allow(messager).to receive(:send_sms)
    end

    it 'sends an sms' do
      expect(messager).to receive(:send_sms).with("Thank you! Your order was placed and will be delivered before 06:09PM")
      subject.complete_order(phone_number, messager, "06:09PM")
    end

  end

end
