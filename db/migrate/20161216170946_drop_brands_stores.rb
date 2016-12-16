class DropBrandsStores < ActiveRecord::Migration[5.0]
  def change
    drop_table :brands_stores
  end
end
