require_relative 'dishes.rb'


class Order
  attr_reader :total

  def initialize(dishes = Dishes.new) # pass in selection of dishes
    @overview = dishes.current_selection
    @total = 0
    @confirmed = false
  end

  def breakdown
    @overview.each { |item| item[:total] = (item[:price] * item[:quantity]).round(2) }
    @overview.each do |item|
      puts "#{item[:name]}, quantity: #{item[:quantity]}, item total: #{item[:total]} "
    end
  end

  def total
    @overview.each { |item| @total += item[:price] * item[:quantity] }
    @total.round(2)
  end

  def confirmed?
    @confirmed
  end

  def confirm
    require_relative 'text'
    @confirmed = true
  end

end
