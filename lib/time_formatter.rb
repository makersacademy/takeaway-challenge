# class TimeFormatter
#   attr_reader :time

#   def initialize(time_class = Time)
#     @time_class = time_class
#   end

#   def formatted_delivery_time
#     time = @time_class.new.calculate_delivery.format
#   end

#   private

#   def calculate_delivery
#     @time += 60 * 60
#   end

#   def format
#     @time.strftime("%k:%M")
#   end
# end
