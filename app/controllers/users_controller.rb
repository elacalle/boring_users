# frozen_string_literal: true

class UsersController < ApplicationController
  COMMON_PARAMETERS = %i[first_name last_name phone_number].freeze

  def index
    users = UserSearchAll.new.call

    render json: { data: { users: users } }
  end

  def show
    user = UserFinder.new.call(params[:id])

    render json: { data: { user: user } }
  rescue UserNotFound
    render json: {}, status: :not_found
  end

  def create
    create_user_form = NewUserForm.new(create_params)

    if create_user_form.valid?
      publish(CreateUserCommand.new(create_user_form.attributes.symbolize_keys))

      render json: { data: { user: create_user_form.attributes } }, status: :created
    else
      render json: { data: { errors: create_user_form.errors.details } }, status: :unprocessable_entity
    end
  end

  def update
    update_user_form = EditUserForm.new(update_params)
    update_user_form.uid = params[:id]

    if update_user_form.valid?
      publish(UpdateUserCommand.new(update_user_form.attributes.symbolize_keys))

      render json: { data: { user: update_user_form.attributes } }, status: :no_content
    else
      render json: { data: { errors: update_user_form.errors.details } }, status: :unprocessable_entity
    end
  end

  def destroy
    publish(DeleteUserCommand.new(uid: params[:id]))

    render json: {}, status: :no_content
  end

  private

  def update_params
    allowed_params(COMMON_PARAMETERS)
  end

  def create_params
    allowed_params(%i[uid email] + COMMON_PARAMETERS)
  end

  def allowed_params(parameters)
    params.require(:data).permit(user: parameters)[:user]
  end
end
