require 'order'
require 'stringio'




describe Order do
  let(:menu) {double :menu, menu_load: "hi", view_menu: "shows menu"}
  let(:menu_class) {double :menu_class, new: menu}
  subject {Order.new(menu_class)}

  describe "#initialize" do
    xit 'initializes start program ' do
        expect(subject).to respond_to(:start_program)
    end
    xit 'initializes ask for order when creating a instance' do
      expect(subject).to respond_to(:ask_for_order)
    end
  end

  describe '#ask_for_order' do
    it 'ask users for input' do
      simulate_stdin("finish\n") do
        expect(subject.ask_for_order).to eq 10
      end
    end
  end

  describe '#user_input' do

  end
end
