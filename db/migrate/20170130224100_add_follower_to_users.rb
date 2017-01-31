class AddFollowerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :followers, :integer

  end
end
