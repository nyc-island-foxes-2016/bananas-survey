class CreateQuestionChoices < ActiveRecord::Migration
  def change
    create_table :question_choices do |t|
      t.integer :question_id
      t.integer :choice_id

      t.timestamps null: false
    end
  end
end
