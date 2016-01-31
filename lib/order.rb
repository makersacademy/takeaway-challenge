# require_relative 'takeaway'

# TODO: verify inclusion of MENU

class Order
  MENU = {}
  def initialize(dishes)
    @dishes = dishes
    # IDEA: this should be passed in and checked internally
    @total = calculate_total
  end

  # IDEA: def order summary
  def verify

  end

  private

  def calculate_total
    # @dishes.each do |k, v|
    #
    # end
  end
end
