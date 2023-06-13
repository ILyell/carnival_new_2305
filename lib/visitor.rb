class Visitor
    attr_reader :name, :height, :spending_money, :preferences

    def initialize(name,height,money)
        @name = name
        @height = height
        @spending_money = money
        @preferences = []
    end

    def add_preference(preference)
        @preferences << preference
    end

    def tall_enough?(height)
        if @height >= height
            true
        else
            false
        end
    end

    def spend_money(money)
        formated_wallet = @spending_money.tr("$", "").to_i
        formated_wallet -= money
        @spending_money = "$" + formated_wallet.to_s
    end
end