class Text_message

    def delivery_time
        current_time = Time.now
        del_time = current_time + 1*60*60
        return del_time
    end

    def send_text
        "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}"
    end
end

