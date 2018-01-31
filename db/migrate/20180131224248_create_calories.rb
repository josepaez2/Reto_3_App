class CreateCalories < ActiveRecord::Migration[5.1]
  def change
    create_table :calories do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :number
      t.datetime :date
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
