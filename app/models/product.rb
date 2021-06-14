class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
    ]
  )

  scope :search_query, lambda { |query|
    where("products.name ilike '%#{query}%'")
  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    order("products.name #{direction}")
  }

end
