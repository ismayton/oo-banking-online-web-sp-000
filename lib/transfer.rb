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
      if @sender.balance >= @amount
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status = 'complete'
      else
        return "Transaction rejected. Please check your account balance."
        @status = "failed"
      end
    end
  end 
  
      
    
end
