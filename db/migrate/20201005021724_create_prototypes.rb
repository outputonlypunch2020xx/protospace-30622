class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :titel
      t.text :catch_copy
      t.text :concept
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
