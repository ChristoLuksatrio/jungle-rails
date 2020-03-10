require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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
    
    it "should let you add to cart" do

      p = Product.all.sample


      visit '/'

      expect(page).to have_text(p.name)

      page.find('.button_to', match: :first).click

      expect(page).to have_text('My Cart (1)')

      save_screenshot 

    end
  end


end
