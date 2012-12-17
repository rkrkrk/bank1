class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :accno
      t.integer :sortcode
      t.integer :balance

      t.timestamps
    end
  end
end
