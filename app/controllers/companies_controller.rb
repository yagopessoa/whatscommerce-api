class CompaniesController < ApplicationController
  def create
    if user_signed_in?
      @company = Company.where(owner: current_user).last

      if @company != nil
        update_existing_company
      else
          @company = Company.create(
            name: allowed_params['name'],
            instagram_url: allowed_params['instagram_url'],
            facebook_url: allowed_params['facebook_url'],
            whatsapp_number: allowed_params['whatsapp_number'],
            page_url: allowed_params['page_url'],
            owner: current_user,
          )
      end

      render json: @company
    else
      head :unauthorized
    end
  end

  def show
    @company = Company.where(owner: current_user).last

    if @company != nil
      render json: @company
    else
      head 404
    end
  end

  def update
    @company = Company.where(owner: current_user).last

    if @company != nil
      update_existing_company
      render json: @company
    else
      head 404
    end
  end

  private

  def allowed_params
    params.permit(:name, :instagram_url, :facebook_url, :whatsapp_number, :page_url)
  end

  def update_existing_company
    @company.update(
      name: allowed_params['name'] || @company.name,
      instagram_url: allowed_params['instagram_url'] || @company.instagram_url,
      facebook_url: allowed_params['facebook_url'] || @company.facebook_url,
      whatsapp_number: allowed_params['whatsapp_number'] || @company.whatsapp_number,
      page_url: allowed_params['page_url'] || @company.page_url,
    )
  end
end
