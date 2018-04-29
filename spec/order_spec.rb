require 'order'

describe Order do
  let(:menu) { double :menu, menu_load: "hi", view_menu: "shows menu" }
  let(:menu_class) { double :menu_class, new: menu }
  subject { Order.new(menu_class) }

  describe "#initialize" do
    it 'initializes start program ' do
      expect(subject).to respond_to(:start_program)
    end
    it 'initializes ask for order when creating a instance' do
      expect(subject).to respond_to(:ask_for_order)
    end
  end
  describe '#make_order' do
    it 'responds to the method' do
      allow(menu).to receive(:dish_check)
      expect(subject).to respond_to(:make_order).with(2).arguments
    end
  end
  describe '#view_menu' do
    it 'runs the method in menu' do
      expect(subject.view_menu).to eq "shows menu"
    end
  end
  describe '#make_order' do
    it 'runs the method in menu' do
      expect(subject.view_menu).to eq "shows menu"
    end
  end
end
