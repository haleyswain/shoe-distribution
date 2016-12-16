class RecreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :brands_stores do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)
    end
  end
end
