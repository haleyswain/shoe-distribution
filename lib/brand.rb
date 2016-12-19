class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  before_save(:capitalize_name)

  def capitalize_name
    brand = self.name.split
    name = brand.map { |brand| brand.capitalize }
    self.name = name.join(' ')
   end
end
