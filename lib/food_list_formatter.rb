require_relative 'sterling_price_formatter'

class FoodListFormatter

  MAX_QUANTITY = 30

  def initialize(parsed_json, max = MAX_QUANTITY)
    @json = parsed_json
    @quantity = [max, parsed_json.size-1].min
    @food_prices = []
  end

  def convert_sterling
    spf = SterlingPriceFormatter.new @json, @quantity
    @food_prices = spf.convert
    formatter
  end

  private

  def formatter
    unsorted_food_hash = Hash[*@food_prices]
    sorted_name_value_array = unsorted_food_hash.sort.flatten
    Hash[*sorted_name_value_array]
  end
end
