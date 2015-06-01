class RemoveProcIdFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :proc_id, :integer
  end
end
