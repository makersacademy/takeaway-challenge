# Introduction

Program to takes an order for a takeaway delivery.

Order class has method that takes an argument (item and the quantity), which looks up a hash in a created dishes object and adds to a bill, whilst informing the customer what they have ordered. The bill amount can be viewed by the customer and when the order is complete, a send message object is created that sends and confirmation text to the customer, with an estimated time of arrival and bill amoumnt.

# Things to be improved

Not 100% happy with having each element of order as a repeat of a method and want to investigate having the whole order dealt with at once. Also need to work on mocking and isolation of tests as it's not currently a strong point. Some dependancy injection to be introduced to in a future update.
