require 'rails_helper'

RSpec.feature "Cart", type: :feature, js: true do
  before :each do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'e-mail',	with: 'admin@admin.com'
      fill_in 'password',	with: 'admin123'
    end
    click_button 'login'
  end
  context 'Accessing cart page' do
    let(:qnt_product) { find('#userNavSection > ul > li:nth-child(1) > a > span').text }
    it 'number of products should be equal to cart navbar quantity' do
      visit('/cart')
      expect(page).to have_selector('.row .product-row', count: qnt_product.to_i)
    end
  end


  context 'when click to remove a product from cart' do
    it 'decrease the amount of products' do
      visit('/products')
      link_path = '#product_filterrific_results > div.row.row-cols-1.row-cols-md-4.g-4 > div:nth-child(2) > div > a'
      find(link_path).click
      using_wait_time 2 do
        find('a.addOrRemoveBtn').click
        using_wait_time 1 do
          visit('/cart')
          products_qnt = find('#userNavSection > ul > li:nth-child(1) > a > span').text
          find('#simple-cart > form > div > div.col-lg-9 > div > div:nth-child(5) > a.remove-from-cart').click
          using_wait_time 1 do
            expect(page).to have_selector('.row .product-row', minimum: products_qnt.to_i - 1)
            expect(page).to have_selector('span.cart-count', minimum: products_qnt.to_i - 1)
          end
        end
      end
    end
  end
end