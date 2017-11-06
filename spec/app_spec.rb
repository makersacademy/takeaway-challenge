require_relative '../app'

describe App do

  let(:takeaway) do
    double(:takeaway, print_menu: 'hello', incoming_confirmation: 'ok')
  end

  let(:responder) { double(:responder, to_xml: 'hello') }
  let(:responder_class) { double(:responder_class, new: responder) }

  before(:each) do
    allow_any_instance_of(App).to receive(:takeaway).and_return(takeaway)
  end

  before(:each) do
    allow_any_instance_of(App).to receive(:responder)
      .and_return(responder_class)
  end

  describe 'get /' do
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

  describe 'post /sms' do

    context 'when receiving order' do
      before(:each) { post '/sms', 'Body' => 'y', 'From' => '123' }
      after(:each) { post '/sms', 'Body' => 'y', 'From' => '123' }

      it 'should return ok' do
        expect(last_response).to be_ok
      end

      it 'calls takeaway incoming_confirmation' do
        expect(takeaway).to receive(:incoming_confirmation).with('123', 'y')
      end
    end
  end
end
