require 'total_verifier'

describe TotalVerifier do

  let(:total_verifier){ described_class }

  it 'checks that two numbers are equal' do
    message = "Those two numbers are not equal"
    expect {total_verifier.verify(12.50, 12.49)}.to raise_error message
  end

end
