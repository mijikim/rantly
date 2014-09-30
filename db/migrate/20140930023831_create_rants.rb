class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :category
      t.text :rant
      t.integer :user_id
    end
  end
end
