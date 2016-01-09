class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :survey_id
      t.integer :question_id
      t.integer :user_id
      t.integer :choice_id

      t.timestamps null: false
    end
  end
end
