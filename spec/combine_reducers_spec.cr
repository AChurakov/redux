# require "./spec_helper"

# alias Profile = Hash(String, String)
# alias Payments = Hash(String, String)
# alias TestState1 = Hash(String, Profile | Payments)
# alias State = Hash(String, Hash(String, String))

# class TestStore1 < Redux::Store
#   @state : State
#   @reducer : Proc(State, Redux::Action, State)
# end

# class Action::SetName < Redux::Action
#   @payload : String
# end

# describe "Redux" do
#   describe "test combine reducers" do
#     reducer1 = -> (state : Profile, action : Action::SetName) {
#       case action.type
#       when "NAME"
#         state["NAME"] = action.payload
#       end
#       state
#     }

#     reducer2 = -> (state : Payments, action : Action::SetName) {
#       case action.type
#       when "ADD_PAYMENT"
#         state["data"] = action.payload
#       end
#       state
#     }

#     it "return store" do
#       reducer = Redux.CombineReducers({ "profile" => reducer1, "payments" => reducer2 }.to_h, TestState1, Action::SetName)
#       # store = TestStore1.new({ "profile" => { "NAME" => "1984" }, "payments" => { "ADD_PAYMENT" => "to day" } }, reducer)
#       # store.state.should eq({ "profile" => { "NAME" => "1984" }, "payments" => { "ADD_PAYMENT" => "to day" } })
#     end

#     it "update store" do
#       # reducer = Redux.combine_reducers({ "profile" => reducer1, "payments" => reducer2 }.to_h)
#       # store = Redux::Store(State, Proc(State, Redux::Action, State)).new({ "profile" => { "NAME" => "1984" }, "payments" => { "ADD_PAYMENT" => "to day" } }, reducer)
#       # store.dispatch(Action::SetName.new("NAME", "New Name"))
#       # puts store.state
#     end
#   end
# end
