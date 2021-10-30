from twilio.rest import Client
import os

class Text():

    def __init__(self, amount):
        self.amount = amount
    
    def send_text(self):
        ACCOUNT_SID = os.environ['TWILIO_SID']
        AUTH_TOKEN = os.environ['TWILIO_AUTH']
        client = Client(ACCOUNT_SID, AUTH_TOKEN) 
        body = "Amount to pay: " + self.amount
        message = client.messages.create(to = os.environ['PHONE'], 
            from_ = os.environ['TWILIO'],
            body = body
        )    