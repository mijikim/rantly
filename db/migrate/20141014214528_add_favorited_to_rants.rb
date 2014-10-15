class AddFavoritedToRants < ActiveRecord::Migration
  def change
    add_column :rants, :favorited, :integer, default:0
  end
end
