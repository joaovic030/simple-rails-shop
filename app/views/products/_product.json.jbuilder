json.extract! product, :id, :name, :brand_id, :category_id, :image_url, :for, :desc1, :desc2, :created_at, :updated_at
json.url product_url(product, format: :json)
