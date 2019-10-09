class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
