class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :upvotes

      t.timestamps
    end
  end
end
