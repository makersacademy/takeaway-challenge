require 'checkout'

describe Checkout do

  let(:order) {double :order}

  subject {Checkout.new(order)}

  it {expect(subject).to respond_to :submit}

  context 'submit should' do

    it 'raise error if the order total is zero' do
      allow(subject).to receive(:calc_total) {0}
      expect{subject.submit}.to raise_error 'your order is empty'
    end

    it 'raise error if it has already been successful' do
      allow(subject).to receive(:calc_total) {10}
      allow(subject).to receive(:complete) {true}
      expect{subject.submit}.to raise_error 'checkout already complete'
    end

    it 'send a text if the above conditions arent met' do
      allow(subject).to receive(:calc_total) {10}
      allow(subject).to receive(:complete) {false}
      # stub_request(:post, "https://#{ENV['TWILIO_SID']}:#{ENV['TWILIO_AUTH']}@api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_SID']}/Messages.json").
      #    with(:body => {"Body"=>"Thank you! Your order was placed and will be delivered before 13:53", "From"=>"+441279702199", "To"=>"+447766767031"},
      #         :headers => {'Accept'=>'application/json', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'twilio-ruby/4.2.1 (ruby/x86_64-darwin14 2.2.1-p85)'}).
      #    to_return(:status => 200, :body => "", :headers => {})

    end

  end

end
