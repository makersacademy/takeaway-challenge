# class TimeFormatter
#   attr_reader :time

#   def initialize(time = Time.new)
#     @time = time
#   end

#   def delivery_time
#     calculate_delivery_time
#     format
#   end

#   private

#   def calculate_delivery_time
#     @time += 60 * 60
#   end

#   def format
#     @time.strftime("%k:%M")
#   end
# end
