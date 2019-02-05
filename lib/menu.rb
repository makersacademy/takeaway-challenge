# frozen_string_literal: true

# construct the food menu
class Menu
  attr_reader :items

  def initialize
    @items = {
      'Shoryu Ganso Tonkotsu' => 9.50,
      'Kotteri Hakata Tonkotsu' => 9.90,
      'Dracula Tonkotsu' => 9.90,
      'Piri Piri Tonkotsu' => 9.90,
      'Karaka Tan Tan Tonkotsu' => 9.90,
      'Origin Tonkotsu' => 9.90,
      'Kimchi Seafood Tonkotsu' => 12.90,
      'Curry Ramen' => 9.90
    }
  end

  def show
    items.each do |key, value|
      currency = format('%.2f', value)
      print "#{key}#{' ' * (35 - key.length - currency.to_s.length)}"
      print "£#{currency}\n"
    end
    print "\n"
  end
end
