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
  
   def reverse_transfer
    if valid? && reciever.balance > amount && self.status == "pending"
      receiver.withdrawal(self.amount)
      sender.deposit(self.amount)
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  
end
