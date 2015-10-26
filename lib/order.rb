require './lib/menu.rb'
require './lib/verify.rb'

class Order

attr_reader :current_order, :current_menu, :no_of_item, :item_total, \
            :collect_amount, :text_message

    def initialize(menu_klass: Menu, verify_klass: Verify)
      @current_order = []
      @current_menu = []
      @menu_klass = menu_klass
      @verify_klass = verify_klass

    end

    def start_order(item, no_of_item)
     current_menu << menu_klass.new
     current_order << current_menu[0].menu.select {|k,v| k == item}
     current_order[-1][:no_of_item] = no_of_item
     current_order[-1][:item_total] = (current_order[-1][item] \
     * current_order[-1][:no_of_item])

    end

    def next_item(item, no_of_item)
      current_order << current_menu[0].menu.select {|k,v| k == item}
      current_order[-1][:no_of_item] = no_of_item
      current_order[-1][:item_total] = (current_order[-1][item] \
      * current_order[-1][:no_of_item])
    end

    def order_total
      @collect_amount = 0
      i = 0
      while i < current_order.length
        current_order[i][2]
        @collect_amount  += current_order[i][:item_total]
        i += 1
      end
      @collect_amount
    end

    def confirmation
      @text_message = "Thank you for your order it will arrive by \n \
      #{(Time.now + (60*40)).strftime("%H:%M")}, \n \
      you have ordered: #{ current_order.each {|item| puts item}} \n \
      the amount total is #{"£%.2f"%collect_amount}"

    end

    def send_text
      Verify.new.send_message(@text_message)
    end




  private

    attr_reader :menu_klass
    attr_reader :verify_klass
end
