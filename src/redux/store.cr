module Redux
  class Action(PayloadType)
    getter :type
    getter :payload

    @payload : PayloadType

    def initialize(@type : String, @payload : PayloadType)
    end

    def self.empty
      Action::Empty.new
    end
  end

  class Action::Empty < Action(Nil)
    def initialize
      @type = "EMPTY"
      super(@type, nil)
    end
  end

  class Store
    getter :state

    def initialize(@state : StateType, @reducer : ReducerType) forall StateType, ReducerType
      dispatch(Action::Empty.new)
    end

    def dispatch(action : Action) forall Action
      @state = @reducer.call(@state, action)
    end
  end
end
