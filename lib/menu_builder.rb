require_relative 'food_list_formatter'
require 'net/http'
require 'json'
require 'dotenv'
Dotenv.load


class MenuBuilder

  attr_reader :list

  def initialize(list = MenuBuilder.build)
    @list = list
  end

  private

  KEY = ENV['FOOD_API_KEY']

  def self.build
    formatter = FoodListFormatter.new(add_data)
    formatter.convert_sterling
  end

  def self.add_data
    url = "http://api.cs50.net/food/3/menus?key=#{KEY}&sdt=2011-03-21&output=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end




