class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, :presence => true)
  before_save(:capitalize_name)


def capitalize_name
    store = self.name.split
    name = store.map { |store| store.capitalize }
    self.name = name.join(' ')
  end
end
