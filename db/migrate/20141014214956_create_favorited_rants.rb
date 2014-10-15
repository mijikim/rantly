class CreateFavoritedRants < ActiveRecord::Migration
  def change
    create_table :favorited_rants do |t|
      t.belongs_to :rant, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
