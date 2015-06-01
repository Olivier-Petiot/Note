class AddProIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :pro_id, :integer
  end
end
