class DigitalTill

  def initialize(order)
    @order = order
  end

  def verify_total(total)
    total == items_total
  end

  def itemised_receipt
    "\nRECEIPT:\n" + @order.map { |food|
      "#{food[:quantity]} x #{food[:item].capitalize} - £#{food[:cost]}"
    }.join("\n") + "\nTOTAL - £#{items_total}\n"
  end

  private

  def items_total
    @order.map { |item| item[:cost] }.sum
  end
end
