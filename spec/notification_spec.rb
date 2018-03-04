  



  # it 'sends a text message via the Twilio API after a notication is created' do
  #   headers = {
  #     "ACCEPT" => "application/json"
  #   }

  #   post "/notifications",
  #   {
  #     notification: {
  #       phone: "1234567890",
  #       body: "New Message",
  #       source_app: "my_app_name"
  #     }
  #   }, headers

  #   expect(FakeSms.messages.last.num).to eq("1234567890")
  # end