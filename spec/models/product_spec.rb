require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {
    Product.new(name: "Anything",
                price: 124.99,
                quantity: 1,
                category_id: 1)
  }

  before do
    @product = Product.new(name: "Anything",
                          price: 124.99,
                          quantity: 1,
                          category_id: 1)
  end

  describe 'Validations' do
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
  end
end
