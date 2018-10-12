require_relative 'menu'
# require 'dotenv/load'

# task mytask: :dotenv do
#     # things that require .env
# end

class Takeaway

include Menu

  def initialize()
  # new_order = Order.new
  end

  def menu
    print format_menu_items
  end
end
