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
