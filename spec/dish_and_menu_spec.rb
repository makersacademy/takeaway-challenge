require 'dish_and_menu'

RSpec.describe Menu do

    describe 'display_menu' do
        before(:each) do
            allow(subject).to receive(:puts).and_return(nil)
        end

        it 'Prints list of dishes' do
            expect(subject.display_menu(0)).to eq nil
        end
    end

    describe 'add_dish' do
        before(:each) do
            allow(subject).to receive(:puts).and_return(nil)
        end
        
        it 'Allows the user to add a new starter' do
            allow(subject).to receive(:gets).and_return("Test", "1.00", "starter")
            subject.add_dish
            expect(subject.dishes[0][0].name).to eq "Test"
            expect(subject.dishes[0][0].price).to eq "1.00"
        end

        it 'Allows the user to add a new main' do
            allow(subject).to receive(:gets).and_return("Test", "1.00", "main")
            subject.add_dish
            expect(subject.dishes[1][0].name).to eq "Test"
            expect(subject.dishes[1][0].price).to eq "1.00"
        end

        it 'Allows the user to add a new dessert' do
            allow(subject).to receive(:gets).and_return("Test", "1.00", "dessert")
            subject.add_dish
            expect(subject.dishes[2][0].name).to eq "Test"
            expect(subject.dishes[2][0].price).to eq "1.00"
        end
    end

    describe 'select_dish' do
        let(:dish1) {double(:price => "5.00", :name => "Fish and Chips")}

        it 'Returns the selected dish' do
            subject.dishes[1] << dish1
            allow(subject).to receive(:gets).and_return("1")
            expect(subject.select_dish(1)).to eq dish1
        end
    end

    describe 'shopping_menu' do
        before(:each) do
            allow(subject).to receive(:puts).and_return nil
        end

        it 'Quits the program when user inputs 2' do
            allow(subject).to receive(:gets).and_return "2"
            expect(subject.shopping_menu).to eq nil
        end

        it 'Calls the shopping menu when user inputs 1' do
            allow(subject).to receive(:shopping_options).and_return nil
            allow(subject).to receive(:gets).and_return("1","2")
            expect(subject).to receive(:menu_options)
            subject.shopping_menu
        end
    end

    describe 'shopping_options' do
        before(:each) do
            allow(subject).to receive(:puts).and_return nil
        end

        it 'Should display starters if user inputs 1' do
            allow(subject).to receive(:gets).and_return("1", "4")
            allow(subject).to receive(:checkout).and_return nil
            expect(subject).to receive(:display_menu)
            subject.menu_options
        end

        it 'Should display starters if user inputs 2' do
            allow(subject).to receive(:gets).and_return("2", "4")
            allow(subject).to receive(:checkout).and_return nil
            expect(subject).to receive(:display_menu)
            subject.menu_options
        end

        it 'Should display starters if user inputs 3' do
            allow(subject).to receive(:gets).and_return("3", "4")
            allow(subject).to receive(:checkout).and_return nil
            expect(subject).to receive(:display_menu)
            subject.menu_options
        end

        it 'Should call checkout if user inputs 4' do
            allow(subject).to receive(:gets).and_return("4")
            allow(subject).to receive(:checkout).and_return nil
            expect(subject).to receive(:checkout)
            subject.menu_options
        end
    end

    describe 'checkout' do
        let(:dish1) {double(:price => "5.00", :name => "Fish and Chips")}
        let(:dish2) {double(:price => "2.50", :name => "Ice cream")}

        before(:each) do
            allow(subject).to receive(:puts).and_return nil
            allow(subject).to receive(:print_receipt).and_return(nil)
            allow(subject).to receive(:send_text_confirmation).and_return(nil)
        end

        it 'Totals basket and calls print receipt, calls the basket check' do
            basket = [dish1, dish2]
            allow(subject).to receive(:check_order?).and_return(true)
            expect(subject).to receive(:print_receipt)
            expect(subject).to receive(:send_text_confirmation)
            expect(subject.checkout(basket)).to eq 7.5
        end

        it 'Returns nil if user cancels order' do
            basket = [dish1, dish2]
            allow(subject).to receive(:check_order?).and_return(false)
            expect(subject).to receive(:print_receipt)
            expect(subject.checkout(basket)).to eq nil
        end
    end

    describe 'send_text_confirmation' do
        it 'Sends text and returns true if text is sent' do
            expect(subject.send_text_confirmation).to eq true
        end
    end

end