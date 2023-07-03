class AccountsController < ApplicationController
  def index
    @accounts = Account.order(:created_at)
  end

  def show
    @account = Account.find_by!(id: params[:id])
  end

  def new
    @account = Account.new
  end

  # TODO: Agregar los mensaje al archivo de traducciones
  def create
    @account = Account.new(secure_params)

    return redirect_to accounts_path, notice: I18n.t("flash.accounts.create.notice") if @account.save

    flash.now.alert = I18n.t("flash.accounts.create.alert")
    render :new
  end

  def edit
    @account = Account.find_by!(id: params[:id])
  end

  # TODO: Agregar los mensaje al archivo de traducciones
  def update
    @account = Account.find_by!(id: params[:id])

    @account.update(secure_params) and return redirect_to(accounts_path, notice: I18n.t("flash.accounts.update.notice"))

    flash.now.alert = I18n.t("flash.accounts.update.alert")
    render :edit
  end

  # TODO: Hay que refactorizar más adelante.
  def page_not_found
    respond_to do |format|
      format.html { render file: "#{RAILS_ROOT}/public/404.html", status: :not_found }
      format.all { render nothing: true, status: :not_found }
    end
  end

  private

  def secure_params
    params.require(:account).permit(:reference, :entity, :alias, :description)
  end
end
