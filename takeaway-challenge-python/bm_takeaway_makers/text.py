from twilio.rest import Client
import os

class Text():

    def __init__(self, amount):
        self.amount = amount
    
    def send_text(self):
        ACCOUNT_SID = 'AC689c9b403f665624169c2c5c82b74721'
        AUTH_TOKEN = 'a0bfd23ed8cc773ad2ea4a7e2c853f41'
        client = Client(ACCOUNT_SID, AUTH_TOKEN) 
        body = "Amount to pay: " + self.amount
        message = client.messages.create(to = os.environ['PHONE'], 
            from_ = os.environ['TWILIO'],
            body = body
        )    