require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  describe "The home page" do
    
    it "should let you navigate to product detail" do
      p = Product.all.sample

      visit '/'

      expect(page).to have_text(p.name)

      product_elt = page.find(:xpath, "//a/h4", text: p.name)

      product_elt.click

      expect(page).to have_selector 'body'

    end
  end

end
