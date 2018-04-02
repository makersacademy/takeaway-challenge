require 'phone'

describe 'Phone' do
  subject(:phone) {Phone.new}

  describe '#send_confirmation' do

    it "sends confirmation that the order has been delivered" do
      VCR.use_cassette('twilio') do
        #vcr used to mock http requests. loads twilio and completes test. better than stubbing. requires webmock, rspec library fror mocking http requests
        phone.send_confirmation
      end
    end
  end

end

