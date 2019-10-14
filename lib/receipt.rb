require 'order'

module Receipt

  def generate_receipt(order)
    order.items.each { |item| "#{item}\n" }
  end

  def receipt_total(order)
    total = 0
    order.each { |item| total += item[:quantity]*item[:price].to_f}
    "Total = #{sprintf "%.2f", total}"
  end

end
