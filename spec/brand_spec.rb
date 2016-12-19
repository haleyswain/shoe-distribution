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

  describe('#capitalize_name') do
    it('capitalizes the name of the brand') do
      brand = Brand.create({:name => 'murphys shoes'})
      expect(brand.name).to (eq('Murphys Shoes'))
    end
  end
