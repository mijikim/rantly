class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :category
      t.string :rant
    end
  end
end
