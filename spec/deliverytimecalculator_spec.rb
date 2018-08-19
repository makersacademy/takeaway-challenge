require 'deliverytimecalc'

describe DeliveryTimeCalc do 

  it { is_expected.to respond_to(:add_one_hour) }

  it "will display one hour from now" do 
    now = Time.new
    hour = now.strftime("%H").to_i
    minute = now.strftime("%M")

    expect(subject.add_one_hour).to eq("#{hour + 1}:#{minute}")
  end

end
