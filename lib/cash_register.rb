require "pry"

class CashRegister

attr_accessor :discount, :total, :last_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @all = []

  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    @last_price = price
    while quantity > 0
      @all << title
      quantity -= 1
    end
  end

  def apply_discount
    return "There is no discount to apply." if @total == 0
    @total = @total - (@total * @discount.to_f/100)
    return "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @all
  end

  def void_last_transaction
    @total -= @last_price
  end

end
