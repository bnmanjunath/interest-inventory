class AddQuestionAndAnswerToInterests < ActiveRecord::Migration[5.1]
  def change
  	add_column :interests, :question, :string
  	add_column :interests, :answer, :integer
  end
end
