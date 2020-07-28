class Transfer
  
  attr_reader :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid? 
    @sender.valid? && @receiver.valid? ? true:false 
  end 
  
  def execute_transaction
    if @status == "pending"
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
    end
    if @sender.valid?
      @status = 'complete'
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    @status = "reversed"
    @receiver.withdraw(@amount)
    @sender.deposit(@amount)
  end 
  
      
    
end
