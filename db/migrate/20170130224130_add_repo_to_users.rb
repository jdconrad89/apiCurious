class AddRepoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :repo, :string

  end
end
