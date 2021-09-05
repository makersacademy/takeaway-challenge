\*\* Takeaway Challenge

This is a commandline based application which allows customers to order food from a menu.

This application was built in Ruby and was completed with TDD to 92% coverage.

---

Included:

- Customisable menu through Google Sheets API
- Show the Menu
- Add items to your order
- Review your order
- Remove items from your order
- Text alert using Twillo API

---

To Run:

- Clone Repo: `git clone https://github.com/EMDevelop/takeaway-challenge.git`
- Navigate to the current directory.... `/path/to/takeaway-challenge`
- Enter IRB `irb -r './lib/eds_diner.rb'`
- Create a new diner `eds_diner = EdsDiner.new`
- Begin App `eds_diner.order`

---

- Note,If you clone the repository you will need to
  - Create a Googlesheet like this: https://docs.google.com/spreadsheets/d/1iHuU9WxLWYeGf9Zdo187Oy4y5nQAcwNkZHJ71XcelAU/edit?usp=sharing
  - Setup Google Sheets API (see instructions: https://github.com/EMDevelop/takeaway-challenge/blob/main/lib/google_sheet.rb)
  - Setup a twillo account
  - Add the following ENV variables to a .env file:
    - SID= (Find on your Twillo Account)
    - TOKEN= (Find on your Twillo Account)
    - MESSAGEID= (Twillo Generates when you enable messaging)
    - TRIALNUM= (use the number they set you up with as free on twillo)
    - MYNUM= (use the number you set up on twillo)
