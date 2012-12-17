class Transaction < ActiveRecord::Base

validate :must_have_funds
validates :type_,  :presence => true
validates :amount,  :presence => true,
	:numericality => { :only_integer => true }
validates :description,  :presence => true

before_save :update_account_balance

	def must_have_funds
  	  if self.type_ == "debit" || self.type_ == "transfer"
   	 	 object = Account.find(account)
    		 if self.amount.to_i > object.balance.to_i
    		 	errors.add(:insuffient_funds, "reduce amount below account balance")
    		 end
    	 end
	end

 def update_account_balance
 	object = Account.find(account)
 	if self.type_ == "debit" || self.type_ == "transfer"
            self.balance = object.balance - self.amount
            object.balance = self.balance # self is the fruit
            object.save
        else
             self.balance = object.balance + self.amount
	     object.balance = self.balance # self is the fruit
             object.save
        end
  end
  belongs_to :account
end
