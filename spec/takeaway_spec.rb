require 'takeaway'

describe Takeaway do
  let(:menu) { double('menu') }
  subject { Takeaway.new(menu) }

  describe '#show_menu' do
    
    it 'should present menu to user' do
      menu_dishes = 'dish'
      allow(menu).to receive(:pretty_dishes).and_return(menu_dishes)
      expect(subject).to receive(:puts).with(menu_dishes)

      subject.show_menu
    end
  end

  describe '#prompt' do

    before :each do
      expect(subject).to receive(:puts).with("Select an option:\n1.\tMenu\n2.\tOrder\n3.\tShow Order\n9.\tExit")
    end

    it 'should display menu when 1 is entered' do
      user_input = "1\n"
      allow(subject).to receive(:gets).and_return(user_input)
      expect(subject).to receive(:show_menu)

      subject.prompt
    end

    it 'should add order when 2 is entered' do
      user_input = "2\n"
      allow(subject).to receive(:gets).and_return(user_input)
      expect(subject).to receive(:add_order)

      subject.prompt
    end

    it 'should show order when 3 is entered' do
      user_input = "3\n"
      allow(subject).to receive(:gets).and_return(user_input)
      expect(subject).to receive(:show_order)

      subject.prompt
    end

    it 'should exit application when 9 is entered' do
      user_input = "9\n"
      allow(subject).to receive(:gets).and_return(user_input)
      expect(subject).to receive(:exit).with(0)

      subject.prompt
    end

    it 'should request valid input when input is invalid' do
      user_input = "E\n"
      allow(subject).to receive(:gets).and_return(user_input)
      expect(subject).to receive(:puts).with("Please select a valid option")

      subject.prompt
    end
  end

  describe '#add_order' do
    let(:order_class) { double("Order class") }
    let(:order) { double("order") }
    let(:dish) { double("dish") }
    subject { Takeaway.new(menu, order_class) }

    before :each do
      allow(order_class).to receive(:new).and_return(order)
      expect(subject).to receive(:puts).with("Please input a dish id")
    end

    it 'should add dish to current order' do
      dish_id_input = "1\n"
      dish_qt_input = "5\n"
      allow(subject).to receive(:gets).and_return(dish_id_input, dish_qt_input)
      allow(menu).to receive(:get_dish).with(1).and_return(dish)
      expect(subject).to receive(:puts).with("How many would you like?")
      expect(order).to receive(:add_dish).with(dish, 5)

      subject.add_order
    end

    it 'should not add an invalid dish to current order' do
      user_input = "99\n"
      allow(subject).to receive(:gets).and_return(user_input)
      allow(menu).to receive(:get_dish).with(99).and_return(nil)
      expect(subject).to receive(:puts).with("Invalid Dish")
      expect(order).not_to receive(:add_dish)

      subject.add_order
    end
  end

  describe '#show_order' do

    let(:current_order) { double("current_order") }

    it 'shows total cost of order' do
      subject.current_order = current_order
      allow(current_order).to receive(:order_total).and_return(5)

      expect(subject).to receive(:puts).with("Cost: £5.00")

      subject.show_order
    end

    it 'shows order is empty if current order is nil' do
      expect(subject).to receive(:puts).with("Order is empty")

      subject.show_order
    end
  end
end
