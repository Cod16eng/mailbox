class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :attachment
      t.string :sender
      t.date :received

      t.timestamps
    end
  end
end
