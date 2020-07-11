class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :context
      t.text :name
      t.boolean :finished

      t.timestamps
    end
  end
end
