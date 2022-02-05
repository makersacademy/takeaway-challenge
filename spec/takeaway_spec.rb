require_relative '../lib/takeaway'

describe Takeaway do
  describe '#display_menu' do
    it 'should start with no dishes on a menu' do
      expect(subject.display_menu).to be_empty
    end
  end

  describe '#add_dish_to_menu' do
    it 'should add one dish to the menu' do
      subject.add_dish_to_menu(:dish_1, 10)
      expect(subject.menu.size).to eq 1
    end
  end

  describe '#display_menu' do
    it 'should display dishes on a menu' do
      test_menu = { "Dish 1" => 10, "Dish 2" => 12, "Dish 3" => 14 }
      subject.add_dish_to_menu("Dish 1", 10)
      subject.add_dish_to_menu("Dish 2", 12)
      subject.add_dish_to_menu("Dish 3", 14)
      expect(subject.display_menu).to eq test_menu
    end
  end

  let (:order) { double :order }
  describe '#recieve_order' do
    it 'should recieve an order with 1 argument' do
      subject.receive_order(:order)
      expect(subject).to respond_to(:receive_order).with(1).argument
    end
  end

    # it 'should send a text when passed an order' do
      # expect(subject.receive_order(order)).to send_text?
      # you need to mock HTTP requests
      # https://stackoverflow.com/questions/48364728/how-to-fix-twiliorestresterror-while-testing-with-rspec
    # end
  # end
end
