class StudentsController < ApplicationController
    def index
        student = Student.all
        render json: student, include: :instructor, status: :created
    end

    def create
        student = Student.create!(student_params)
        render json: student
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def destroy
        student = Student.find_by(id: params[:id])
        if student
            student.destroy
            head :no_content
        else
            render json: { error: "Bird not found" }, status: :not_found
        end
    end

    def update
        student = Student.find_by(id: params[:id])
        if student
            student.update(student_params)
            render json: student
        else
            render json: { error: "student not found"}, status: :not_found
        end
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end
end
