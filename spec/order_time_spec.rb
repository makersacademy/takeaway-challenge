require 'order_time'
require 'time'

describe OrderTime do
  let(:time_double_one) { Time.strptime("08:15", "%R")  }
  let(:time_double_two) { Time.strptime("12:07", "%R")  }
  let(:time_double_three) { Time.strptime("23:30", "%R") }

  describe '#delivery_time' do

    describe 'returns order time plus an hour' do

      it 'for single digit hours' do
        ordertime = described_class.new(time_double_one)
        expect(ordertime.delivery_time).to eq '09:15'
      end

      it 'for single digit minutes' do
        ordertime = described_class.new(time_double_two)
        expect(ordertime.delivery_time).to eq '13:07'
      end

      it 'for two digit hours and minutes' do
        ordertime = described_class.new(time_double_three)
        expect(ordertime.delivery_time).to eq '00:30'
      end
    end
  end
end
