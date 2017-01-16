module ClientDetails
    def client_details
        client_details = {
            account_sid: "12345",
            auth_token: "54321",
            from: "+123456789",
            to: "+987654321",
            body: "Thanks for your order! Expect delivery before %s"
        }
        client_details
    end
end