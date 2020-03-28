require_relative 'list_of_dishes'

class Order
  attr_reader :summary

  def initialize(list_of_dishes, selections, total)
    raise ArgumentError, 'order must not be empty' if selections.empty?

    populate_summary(list_of_dishes, selections)
    verify_total(total)
  end

  private

  def populate_summary(list_of_dishes, selections)
    @summary = {}

    selections.each do |dish, quantity|
      full_dish = list_of_dishes.get_dish(dish)
      @summary[dish] = { quantity: quantity, price: full_dish.price }
    end
  end

  def verify_total(total)
    total_from_summary = 0
    @summary.each do |_, quantity_and_price|
      total_from_summary += quantity_and_price[:quantity] * quantity_and_price[:price]
    end
    total_from_summary = total_from_summary.round(2)

    raise_total_verification_error(total, total_from_summary) if total != total_from_summary
  end

  def raise_total_verification_error(total, total_from_summary)
    error_message = "incorrect order total. Total given = #{total}. Actual = #{total_from_summary}"
    raise ArgumentError, error_message
  end
end
