require 'order'




describe Order do
  let(:menu) {double :menu, menu_load: "hi", view_menu: "shows menu"}
  let(:menu_class) {double :menu_class, new: menu}
  subject {Order.new(menu_class)}

  describe "#initialize" do
    it 'initializes start program ' do
        expect(subject).to respond_to(:start_program)
    end
    it 'initializes ask for order when creating a instance' do
      expect(subject).to respond_to(:ask_for_order)
    end
  end

  describe '#ask_for_order' do

  end

  describe '#user_input' do

  end
end
