require 'confirmation'

describe Confirmation do
  subject {Confirmation.new(["PhadThai", "PhadThai", "SpringRolls"], 23.00)}
  it{is_expected.to respond_to(:print_confirmation)}

  describe '#print_confirmation' do
    context '#when passed order and value' do
      it 'returns a confirmation and total to customer' do
        expect(subject.print_confirmation).to output("PhadThai x 2 £19.00")
      end
    end
  end
end
