class RenameActivationDigestToActivationToken < ActiveRecord::Migration
  def change
    rename_column :users, :activation_digest, :activation_token
  end
end
