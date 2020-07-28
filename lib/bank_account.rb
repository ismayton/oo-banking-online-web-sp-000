class BankAccount

  attr_reader :name, :balance, :status
  
  def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    @balance += amount 
  end 
  
  def display_balance
    @balance 
  end
  
  def valid?
    return true if @banance > 0 && @status == "open"
  end 
  
  
  
end
