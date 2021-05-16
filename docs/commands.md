rails g model Store address url_address annex:integer status:integer

rails g model Category name status:integer

rails g model Product name unit_price:decimal{7-2} brand 'weight:decimal{5,2}' model category:references

rails g model ProductStore product:references store:references quantity:integer

rails g migration AddParentCategoryToCategory
  add_reference :categories, :parent_category, foreign_key: { to_table: :categories }, null: true

rails g model Offer product:references started_at:datetime ended_at:datetime discount:decimal{5-2} status:integer
