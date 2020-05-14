class AddressesController < ApplicationController
  def create
    users_company = get_users_company

    if users_company != nil

      @address = Address.where(company: users_company).last

      if @address != nil
        update_existing_address
      else
          @address = Address.create(
            cep: allowed_params['cep'],
            street: allowed_params['street'],
            number: allowed_params['number'],
            neighborhood: allowed_params['neighborhood'],
            complement: allowed_params['complement'],
            company: users_company,
          )
      end

      render json: @address
    else
      head 404
    end
  end

  def show
    users_company = get_users_company

    @address = Address.where(company: users_company).last

    if @address != nil
      render json: @address
    else
      head 404
    end
  end

  def update
    @address = Address.where(company: get_users_company).last

    if @address != nil
      update_existing_address
      render json: @address
    else
      head 404
    end
  end

  private

  def allowed_params
    params.permit(:cep, :street, :number, :neighborhood, :complement)
  end

  def update_existing_address
    @address.update(
      cep: allowed_params['cep'] || @address.cep,
      street: allowed_params['street'] || @address.street,
      number: allowed_params['number'] || @address.number,
      neighborhood: allowed_params['neighborhood'] || @address.neighborhood,
      complement: allowed_params['complement'] || @address.complement,
    )
  end
end
