require "./spec_helper"

alias TestState = Hash(String, Int32)
alias TestActions =  Action::Increment | Action::Decrement | Redux::Action::Empty

class TestStore < Redux::Store
  @state : TestState
  @reducer : Proc(TestState,  TestActions, TestState)
end

class Action::Increment < Redux::Action(NamedTuple(hello: String))
end

class Action::Decrement < Redux::Action(Nil)
end

describe "Redux" do
  describe "Redux::Store" do
    describe "example: counter reducer" do
      reducer = -> (state : TestState, action : TestActions){
        case action.type
        when "INCREMENT"
          state["counter"] += 1
        when "DECREMENT"
          state["counter"] -= 1
        end
        state
      }

      it "check initial state" do
        store = TestStore.new(state: { "counter" => 0 }, reducer: reducer)
        store.state.should eq({ "counter" => 0 })
      end

      it "increment" do
        store = TestStore.new({ "counter" => 0 }, reducer)
        store.dispatch(Action::Increment.new("INCREMENT", { hello: "world" }))
        store.state.should eq({ "counter" => 1 })
      end

      it "decrement" do
        store = TestStore.new({ "counter" => 1 }, reducer)
        store.dispatch(Action::Decrement.new("DECREMENT", nil))
        store.state.should eq({ "counter" => 0 })
      end
    end
  end
end
