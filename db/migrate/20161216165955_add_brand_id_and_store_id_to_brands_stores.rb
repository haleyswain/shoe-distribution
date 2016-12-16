class AddBrandIdAndStoreIdToBrandsStores < ActiveRecord::Migration[5.0]
  def change
    add_column(:brands_stores, :brand_id, :integer)
  end
    add_column(:brands_stores, :store_id, :integer)
end
