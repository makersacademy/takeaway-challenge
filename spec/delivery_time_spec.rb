require 'delivery_time'

describe DeliveryTime do

  let(:time_klass) { double :double }
  let(:time_object1) { double :double, hour: 12, min: 22 }
  let(:time_object2) { double :double, hour: 1, min: 1 }
  subject { described_class.new(time_klass) }

  it 'Pretty prints the hour and minute - 12:22' do
    allow(time_klass).to receive(:now).and_return(time_object1)
    expect(subject.generate_time).to eq("13:22")
  end

  it 'Pretty prints the hour and minute - 02:01' do
    allow(time_klass).to receive(:now).and_return(time_object2)
    expect(subject.generate_time).to eq("02:01")
  end

end
