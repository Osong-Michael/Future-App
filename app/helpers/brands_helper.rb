module BrandsHelper
  def edit_brand_btn(brand)
    link_to 'Edit Brand', edit_brand_path(brand) if brand.user == current_user
  end
end
