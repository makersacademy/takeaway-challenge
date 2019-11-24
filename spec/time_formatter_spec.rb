# require "time_formatter"

# describe TimeFormatter do
#   let(:time_double) { double :time }
#   let(:time_class_double) { double :time_class, new: time_double }
#   let(:time_formatter) { TimeFormatter.new(time_class_double) }

#   describe "#formatted_delivery_time" do
#     it "should return '19:35' if current time is '18:35'" do
#       time = Time.new(2019, 11, 23, 18, 35, 00, "+00:00")
#       expect(time_formatter.formatted_delivery_time).to eq "19:35"
#     end
#   end
# end
