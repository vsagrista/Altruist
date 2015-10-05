class AddTransactionIdToMeeting < ActiveRecord::Migration
  def change
    add_reference :meetings, :transaction, index: true, foreign_key: true
  end
end
