class CategoriesController < ApplicationController
  def index
    users_company = get_users_company

    if users_company != nil

      @categories = Category.where(company: users_company)

      render json: @categories
    else
      head 404
    end
  end

  def create
    users_company = get_users_company

    if users_company != nil

      @category = Category.where(company: users_company, name: allowed_params['name']).last

      @category = Category.create(
        company: users_company,
        name: allowed_params['name']
      ) unless @category != nil

      render json: @category
    else
      head 404
    end
  end

  def destroy
    users_company = get_users_company

    if users_company != nil

      @category = Category.where(company: users_company, id: allowed_params['id']).last

      @category.destroy

      head :ok
    else
      head 404
    end
  end

  private

  def allowed_params
    params.permit(:name, :id)
  end
end
