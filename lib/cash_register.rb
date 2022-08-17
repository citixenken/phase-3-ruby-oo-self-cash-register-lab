class CashRegister
    attr_accessor :total, :discount, :items, :latest_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.latest_transaction = price * quantity
        self.total += self.latest_transaction
        quantity.times { self.items << title}
    end

    def apply_discount
        if self.discount != 0
            perc_discount = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * perc_discount).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.latest_transaction
    end
    
end
