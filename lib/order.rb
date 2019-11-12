# frozen_string_literal: true

class Order
  attr_reader :items
  def initialize(items)
    @items = items
  end
end
