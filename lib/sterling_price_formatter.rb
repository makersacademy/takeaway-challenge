
class SterlingPriceFormatter
  def initialize(json,quantity)
    @json = json
    @quantity = quantity
    @food_sterling = []
  end

  def convert
    0.upto(@quantity) do |i|
      @food_sterling << @json[i]['name']
      @food_sterling << "£#{ '%.2f' % [@json[i]['portion'].to_i * 1.2] }"
    end
    @food_sterling
  end
end
