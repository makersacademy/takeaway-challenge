require 'net/http'
require 'json'

class Menu

  attr_reader :list

  KEY = '6c28ebd31abd7d19ae5899fd425b8509'

  def initialize(list = online_data)
    @data = list
    @food_prices = []
    data_sort
  end

  private

  def online_data
    url = "http://api.cs50.net/food/3/menus?key=#{KEY}&sdt=2011-03-21&output=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def data_sort
    0.upto(30) do |i|
      @food_prices << @data[i]['name']
      @food_prices << "£#{ '%.2f' % [@data[i]['portion'].to_i * 1.2] }"
    end
    @list = Hash[*Hash[*@food_prices].sort.flatten]
  end
end



