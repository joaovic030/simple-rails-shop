require 'rails_helper'

RSpec.feature "Products", type: :feature, js: true do
  before :each do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'e-mail',	with: 'admin@admin.com'
      fill_in 'password',	with: 'admin123'
    end
    click_button 'login'
  end
  context 'Accessing products page' do
    it 'should list all products' do
      visit('/products')
      expect(page).to have_css('form#filterrific_filter')
      expect(page).to have_css('#product_filterrific_results .row')
    end

    it 'contains at least 4 products' do
      visit('/products')
      expect(page).to have_selector('a.card-link', minimum: 4)
    end
  end

  context 'when click in a product' do
    it 'should open the product page to buy' do
      visit('/products')
      link_path = '#product_filterrific_results > div.row.row-cols-1.row-cols-md-4.g-4 > div:nth-child(1) > div > a'
      show_path = find(link_path)[:href]
      find(link_path).click
      using_wait_time 1 do
        expect(page).to have_selector(:link_or_button, 'Back')
        expect(page).to have_current_path(show_path)
        expect(page).to have_selector('.card .card-body')
      end
    end
  end

  context 'when adding/removing a product to cart' do
    it 'changes the cart counts on navbar' do
      visit('/products')
      link_path = '#product_filterrific_results > div.row.row-cols-1.row-cols-md-4.g-4 > div:nth-child(1) > div > a'
      find(link_path).click
      using_wait_time 2 do
        cartCountBefore = find('span.cart-count').text
        find('a.addOrRemoveBtn').click
        using_wait_time 1 do
          expect(cartCountBefore).to_not eq(find('span.cart-count').text)
        end
      end
    end
  end
end