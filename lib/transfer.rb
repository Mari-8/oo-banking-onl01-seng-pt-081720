class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
   def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid?
  end
  
   def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.withdrawal(self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
   def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.deposit(self.amount)
      receiver.withdrawl(self.amount)
      self.status = "complete"
    else
      self.status = "reversed"
      "Transaction reversed. Please check your account balance."
    end
  end
  
  
end
