class RemoveProcedIdFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :proced_id, :integer
  end
end
