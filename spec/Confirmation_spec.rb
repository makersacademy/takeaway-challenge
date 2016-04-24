require 'Confirmation'


describe Confirmation do
  subject(:confirmation) { described_class.new("+447880521694") }

  xit "confirms that it has sent a confirmation SMS to the customer's number" do
    allow(confirmation).to receive(:send).and_return("Order confirmed for customer #{@phone_number}! Due to arrive by #{ t }")
    expect (confirmation.send).to eq("Order confirmed for customer #{@phone_number}! Due to arrive by #{ t }")
  end

end
