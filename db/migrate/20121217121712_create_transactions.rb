class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type_
      t.string :description
      t.integer :amount
      t.integer :card
      t.integer :toaccount
      t.integer :balance
      t.string :status
      t.references :account

      t.timestamps
    end
    add_index :transactions, :account_id
  end
end
