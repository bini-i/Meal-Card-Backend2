class V1::EmployeesController < ApplicationController
  before_action :set_employee, only: %i[serve show update destroy ]

  # GET /v1/employees/:id
  def serve
    unless @employee
      render json: {error: "ይቅርታ የማያገለግል ኩፖን ነው"}, status: 404
    else
      if @employee.check_balance?(@order_amount)
        if @employee.serve(@order_amount)
          render json: {success: "ተስተናግዷል", first_name: @employee.first_name, father_name: @employee.father_name, remaining: @employee.remaining}
        else
          render json: {error: "ይቅርታ አልተስተናገዱም"}, status: 500
        end
      else
        render json: {error: "ይቅርታ በቂ ኩፖን የለዎትም", remaining: @employee.remaining}, status: 401
      end
    end 
  end

  # # GET /v1/employees
  def finance
    @employees = Employee.all
    render :finance
  end

  # GET /employees/1
  def show
    render json: @employee
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      # debugger
      @employee = Employee.lock("FOR UPDATE NOWAIT").find_by(employee_id: params[:id])
      @order_amount = params[:employee][:order_amount].to_i
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:order_amount)
    end
  end
