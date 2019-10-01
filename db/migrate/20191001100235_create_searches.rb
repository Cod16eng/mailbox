class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :sender
      t.string :name
      t.date :received
      t.integer :company_id

      t.timestamps
    end
  end
end
