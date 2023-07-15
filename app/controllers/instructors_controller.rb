class InstructorsController < ApplicationController

    def index
        instructors = Instructor.all
        render json: instructors, include: :students, status: :created
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            head :no_content
        else
            render json: { error: "Bird not found" }, status: :not_found
        end
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.update(instructor_params)
            render json: instructor
        else
            render json: { error: "Instructor not found"}, status: :not_found
        end
    end

    private

    def instructor_params
        params.permit(:name)
    end
end
