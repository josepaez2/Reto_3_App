class CreateCalories < ActiveRecord::Migration[5.1]
  def change
    create_table :calories do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :number
      t.string :content
      t.string :c_type

      t.timestamps
    end
  end
end
