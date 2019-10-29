module KepplerTestimonials
  # Policy for Testimony model
  class TestimonyPolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end
  end
end