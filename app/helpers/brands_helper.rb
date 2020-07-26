module BrandsHelper
  def edit_brand_btn(brand) 
    if brand.user == current_user
      link_to 'Edit Brand', edit_brand_path(brand) 
    end
  end
end