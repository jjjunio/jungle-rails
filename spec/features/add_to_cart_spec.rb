require 'rails_helper'

RSpec.feature "Visitor clicks on add to cart button and increases my cart by 1", type: :feature, js: true do

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
  # button class: 'btn btn-primary'
  scenario "They see all products" do
    # ACT
    visit root_path

    expect(page).to have_text 'My Cart (0)'

    #VERIFY
    click_button("Add") 
    expect(page).to have_text 'My Cart (1)'
    
    # DEBUG / VERIFY
    save_screenshot
  end

end