class AddSubjectAndCommentReviewToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :subject, :string
    add_column :transactions, :comment_review, :text
  end
end
