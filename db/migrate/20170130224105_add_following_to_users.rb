class AddFollowingToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :following, :integer

  end
end
