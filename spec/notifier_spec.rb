require 'notifier'


describe Notifier do


  let( :via )     { double 'via', account: account }
  let( :account ) { double 'account', messages: messages }
  let( :messages ) { double 'messages' }

  describe "#call" do
    it "creats a message" do
      expect( messages ).to receive( :create ).with( {
                              from: :from,
                              to:   :to,
                              body: :message
      })
      described_class.call from: :from, to: :to, message: :message, via: via
    end
  end

end

