require('spec_helper')

describe Brand do
  it { should have_and_belong_to_many(:stores) }
end

describe(Brand) do
  it("validates presence of a brand name") do
    brand = Brand.new({:name => ""})
    expect(brand.save()).to(eq(false))
    end
  end
