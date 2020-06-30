require 'rails_helper'

RSpec.feature "Visitor navigates directly to products detail page by clicking one of the product partials", type: :feature, js: true do

  #SETUP 
  before :each do 
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end
  # link_to product, class: 'btn btn-default pull-right'
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot
    
    #VERIFY
    find("a.btn").click 
    expect(page).to have_css 'article.product-detail'
  end

end