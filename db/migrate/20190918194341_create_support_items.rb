class CreateSupportItems < ActiveRecord::Migration[5.2]
  def change
    create_table :support_items do |t|
      t.string :category
      t.string :description
      t.integer :frequency_num
      t.string :frequency_period
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
