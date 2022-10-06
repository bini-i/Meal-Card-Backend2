class Employee < ApplicationRecord
  belongs_to :department

  # check balance for an employee
  def check_balance?(order_amount)
    if self.has_sufficient_balance?(order_amount)
      return true
    else
      false
    end
  end

  # deduct from remaining
  def serve(order_amount)
    if self.remaining <= 0
      return false
    end
    self.remaining -= order_amount
    if self.save
      return true
    else
      return false
    end
  end

  private
  def has_sufficient_balance?(order_amount)
    if self.remaining >= order_amount
      return true
    else
      return false
    end
  end
end
