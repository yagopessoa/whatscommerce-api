class CompaniesController < ApplicationController
  def create
    if user_signed_in?
      # TODO: check if company already exists for this user (max: 1)
      #       if it does, update instead of creating

      company = Company.create(
        name: allowed_params['name'],
        instagram_url: allowed_params['instagram_url'],
        facebook_url: allowed_params['facebook_url'],
        whatsapp_number: allowed_params['whatsapp_number'],
        page_url: allowed_params['page_url'],
        owner: current_user,
      )

      head :ok
    else
      head :unauthorized
    end
  end

  def show
    @company = Company.where(owner: current_user).last
    render json: @company
  end

  def update
    @company = Company.where(owner: current_user).last

    @company.update(
      name: allowed_params['name'] || @company.name,
      instagram_url: allowed_params['instagram_url'] || @company.instagram_url,
      facebook_url: allowed_params['facebook_url'] || @company.facebook_url,
      whatsapp_number: allowed_params['whatsapp_number'] || @company.whatsapp_number,
      page_url: allowed_params['page_url'] || @company.page_url,
    )

    render json: @company
  end

  private

  def allowed_params
    params.permit(:name, :instagram_url, :facebook_url, :whatsapp_number, :page_url)
  end
end
