class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :score
      t.references :question, foreign_key: true

      t.timestamps
    end
    add_index :comments, :comment
  end
end
