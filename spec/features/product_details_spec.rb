require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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

    scenario "click product details " do

      visit root_path

      page.find('.products article:first-child').find_link('Details').trigger('click')

      save_screenshot
      
      expect(page).to have_css 'p.description'

    end

end
