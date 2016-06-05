class Order

	attr_reader :menu_list, :ordered_items, :running_total

	def initialize(menu_list)
		@menu_list = menu_list
		@ordered_items = []
		@running_total = 0
	end

	def add_to_order(item, qty)
		@ordered_items << [item, qty]
		@running_total += @menu_list[item] * qty
	end

	def confirm_order
		fail "Totals are incorrect" unless total_correct?
		messenger = Messenger.new(@running_total)
		messenger.send_text
	end

	private

	def total_correct?
		ordered_items.map {|x,y|	@menu_list[x] * y}.inject(0, :+) == @running_total
	end


end