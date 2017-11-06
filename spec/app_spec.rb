require_relative '../app'

describe App do

  let(:takeaway) { double(:takeaway, print_menu: 'hello', incoming_confirmation: 'ok') }
  let(:responder) { double(:responder, to_xml: 'hello') }
  let(:responder_class) { double(:responder_class, new: responder) }

  before(:each) do
    allow_any_instance_of(App).to receive(:takeaway).and_return(takeaway)
  end

  before(:each) do
    allow_any_instance_of(App).to receive(:responder).and_return(takeaway)
  end

  describe 'GET' do
    before(:each) { get '/' }

    context 'when reaching homepage' do
      it 'should return ok' do
        expect(last_response).to be_ok
      end

      it 'should return menu upon accessing homepage' do
        expect(last_response.body).to eq 'hello'
      end
    end
  end

  describe 'SMS' do

    context 'when receiving confirmation' do
      before(:each) { post '/sms', message: 'Y', 'from': '123' }

      it 'should return ok' do
        expect(last_response).to be_ok
      end

      it 'should return menu upon accessing homepage' do
        # expect(last_response.body).to eq 'ok'
        puts last_response
      end
    end
  end
end
