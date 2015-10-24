require './lib/menu.rb'
require './lib/verify.rb'

class Order

attr_reader :current_order, :current_menu, :item_no, :item_total, :collect_amount

    def initialize(menu_klass: Menu)
      @current_order = []
      @current_menu = []
      @menu_klass = menu_klass
    end

    def start_order(item, item_no)
     current_menu << menu_klass.new
     current_order << current_menu[0].menu.select {|k,v| k == item}
     current_order[-1][:item_no] = item_no
     current_order[-1][:item_total] = (current_order[-1][item] \
     * current_order[-1][:item_no])

    end

    def next_item(item, item_no)
      current_order << current_menu[0].menu.select {|k,v| k == item}
      current_order[-1][:item_no] = item_no
      current_order[-1][:item_total] = (current_order[-1][item] \
      * current_order[-1][:item_no])
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

  private

    attr_reader :menu_klass

end
