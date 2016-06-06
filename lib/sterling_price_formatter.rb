
class SterlingPriceFormatter
  def initialize(json,quantity)
    @json = json
    @quantity = quantity
    @food_sterling = []
  end

  def convert
    0.upto(@quantity) do |index|
      @food_sterling << extract_name_from_json(index)
      @food_sterling << construct_price_from_json(index)
    end
    @food_sterling
  end

  private

  PRICE_INDEX = 1.2

  def extract_name_from_json(index)
    @json[index]['name']
  end

  def construct_price_from_json(index)
    "£#{ '%.2f' % [@json[index]['portion'].to_i * PRICE_INDEX] }"
  end
end
