require 'phone'

describe 'Phone' do
  subject(:phone) {Phone.new}

  describe '#send_confirmation' do

    it "sends confirmation that the order has been delviered" do
      h = Time.now.strftime('%H').to_i + 1
      m = Time.now.strftime('%M').to_i

      phone.stub(:send_confirmation) {"Your order will be placed at #{h}: #{m}."}
      expect(phone.send_confirmation).to eq "Your order will be placed at #{h}: #{m}."
    end

  end

end