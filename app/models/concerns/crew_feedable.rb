require 'active_support/concern'

module CrewFeedable
  DEFAULT_CREW_ASSOC_NAME = :crew.freeze

  extend ActiveSupport::Concern

  included do
    has_many :feeds, as: :feedable
  end

  class_methods do
    def stream_to_crew_feed name, options={}
      actions = Array(options.delete(:on))
      actions.reject! { |val| Feed::ACTIONS.exclude?(val) }

      unless actions.present?
        raise ArgumentError, ":on option must be supplied with (:create, :update, or :destroy)"
      end
      unless reflect_on_all_associations(:belongs_to).any? { |assoc| assoc.name.to_sym == (options[:with] || DEFAULT_CREW_ASSOC_NAME).to_sym }
        raise ArgumentError, "You need a crew association on the feeded model to associate with the feed records (can override using :with option)."
      end

      actions.each do |action|
        CrewFeedableCallback.register(self, name, action, options)
      end
    end
  end

  module CrewFeedableCallback
    CALLBACK_OPTIONS = [:if, :unless].freeze

    def self.register(model_class, name, action, options)
      model_class.send("after_#{action}", options.slice(*CALLBACK_OPTIONS)) do
        record_crew_event!(name, options)
      end
    end
  end

  def record_crew_event!(name, options)
    with = options.delete(:with) || DEFAULT_CREW_ASSOC_NAME

    self.feeds.create!(crew: send(with), name: name)
  end
end