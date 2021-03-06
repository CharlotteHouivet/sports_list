class EvaluationsController < ApplicationController

    def index
      @evaluations = Evaluation.all
    end

    def show
      @evaluation = Evaluation.find(params[:id])
    end

    def new
      @evaluation = Evaluation.new
    end

    def create
      p_eval = params[:evaluation]
      # search in the database Evaluations if the user has already done a comment on this card
      if (Evaluation.where(user_id: current_user.id, card_id: params[:id]).empty?)
        @evaluation = Evaluation.create(comment: p_eval[:content], eval: p_eval[:eval], card_id: params[:id], user_id: current_user.id)
        redirect_to "/cards/#{params[:id]}"
      end
    end
end
