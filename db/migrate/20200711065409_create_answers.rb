class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :context
      t.text :name

      t.timestamps
    end
  end
end
