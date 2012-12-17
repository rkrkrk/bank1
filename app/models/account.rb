class Account < ActiveRecord::Base

   validates :accno,  :presence => true,
  	:length => { :is => 8 },
  	:numericality => { :only_integer => true }
   validates :sortcode, :presence => true,
       	:length => { :is => 6 },
       	:numericality => { :only_integer => true }
   validates :balance, :presence => true,
   	:numericality => { :only_integer => true }
   has_many :transactions, :dependent => :destroy
end