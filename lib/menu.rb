require 'net/http'
require 'json'
require 'dotenv'
Dotenv.load


class Menu

  attr_reader :list

  def initialize(list = Menu.build)
    @list = list
  end

  private

  KEY = ENV['FOOD_API_KEY']

  def self.build
    @food_prices = []
    @parsed_json = add_data
    data_sort
  end

  def self.add_data
    url = "http://api.cs50.net/food/3/menus?key=#{KEY}&sdt=2011-03-21&output=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.data_sort
    0.upto(30) do |i|
      @food_prices << @parsed_json[i]['name']
      @food_prices << "£#{ '%.2f' % [@parsed_json[i]['portion'].to_i * 1.2] }"
    end
    Hash[*Hash[*@food_prices].sort.flatten]
  end
end


