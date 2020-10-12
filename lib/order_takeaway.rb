# require_relative 'basket'
# require_relative 'print'
# require_relative 'text'
# require_relative 'menu'

# class OrderTakeaway

#     attr_reader :place_order

#     def initialize(texter = Text.new)
#         @place_order = false
#         @texter = texter
#     end

#     def order
#         @place_order = true
#         @texter.send_confirmation
#     end

# end