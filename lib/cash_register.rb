require 'pry'

class CashRegister
    attr_accessor :discount, :total, :void
    def initialize(discount=0)
        @discount = discount
        @total = 0
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        @total = @total + price * quantity
        @array_of_items ||= []
        (1..quantity).each do |num|
          @array_of_items << title  
        end
        @void = price * quantity
    end
    
    def apply_discount
        @total = @total - @total * @discount / 100.00
        if @discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @array_of_items
    end

    def void_last_transaction
        @total = @total - @void
    end

end
