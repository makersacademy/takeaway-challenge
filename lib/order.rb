class Order

attr_accessor :items, :summary

	def initialize(items = Array.new, summary = String.new)
	@items = items
	@summary = summary
	end

	def list_summary(item,quantity)
		item.map do |key,value|
		price = sprintf('%.2f', value*quantity)
		@summary += " #{key} x #{quantity} = £#{price} |"
		end
	end

	def price
		total = 0
		@items.map do |item|
		item.each do |item ,price|
		total += price
		end
		end
		total
	end


end