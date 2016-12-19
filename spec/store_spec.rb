require('spec_helper')

describe Store do

  describe('#brands') do
  it { should have_and_belong_to_many(:brands) }
  end
end

describe(Store) do
  it("validates presence of a store name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
    end
  end

describe('#capitalize_name') do
  it('capitalizes the name of the store') do
    store = Store.create({:name => 'murphys shoe store'})
    expect(store.name).to (eq('Murphys Shoe Store'))
  end
end
