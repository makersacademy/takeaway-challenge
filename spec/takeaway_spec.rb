require './lib/takeaway.rb'

describe 'Takeaway' do
  let (:takeaway) { Takeaway.new }
  let (:menu) { Menu.new }
  let (:order) { Order.new(Menu.new) }

    it 'can display a menu' do
      expect(takeaway).to respond_to :display_menu
    end

    it 'Prints a menu' do
      expect(takeaway.display_menu).to eq(menu.show_menu)
    end

    it 'Prints an order summary' do
      order.add('Chicken Pie')
      order.add('Chicken Pie')
      order.add('Liver Pie')
      takeaway.order.total
      expect(takeaway.price(order)).to eq("Chicken Pie . . . . . £5 \nChicken Pie . . . . . £5 \nLiver Pie . . . . . £3 \nThe total for your order is: £#{order.total}")
    end


  end
