class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :branch_name
      t.string :title
      t.text :content
      t.string :img

      t.timestamps
    end
  end
end
