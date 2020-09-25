# Notes

## Outline

### State Management

- Easy for small components.
- Save state locally.
- This becomes a problem when other parts of the UI want to use the same state.
- Passing state around all the time is cumbersome and error-prone.
- We will need a state management (SM) design pattern.

### Unidirectional data flow

- There are myriads of ways to do SM.
- Several architectures use a concept known as unidirectional data flow.
- This can help make the flow of data throughout an application structured, predictable and reproducible.
- It is very well suited for declarative programming that frameworks like Flutter utilize.
- Also helps separate views from business logic, which can improve modularization.

#### How does it work

- The flow is data and events is represented by a single linear flow.
- A typical unidirectional flow of data:
  1. **State**<br/>
     The UI-layer consumes a model that represents the current state and produces a view for it.
  2. **Event**<br/>
     An action is triggered by the UI-layer (i.e., a button is pressed or a callback is called). This action result in an event with a name and an optional payload.
  3. **Reducer**<br/>
     The event is received by the reducer. This is a pure function that takes in the current state and the action, and produces a new state. This state

### Redux

- Redux is an SM pattern commonly used in the React world.
- _Explain Redux using existing slides..._
- LIVE DEMO

### Bloc

- Stream-based SM pattern
- Similar to Redux in some aspects
- Has several advantages over Redux
- Most used/popular pattern
- Can scale well
- _Explain Bloc..._
- _Explain Bloc can be used per page/feature for scaling large apps..._
- LIVE DEMO

#### Cubits

- Cubit is a smaller version of Bloc.
  - Doesn't follow the spec, but is very similar.
  - It's my favorite SM pattern.
  - Very small, really powerful.
  - _Explain Cubits..._
- LIVE DEMO

### Wrap up

- What have we learned?
- What pattern should you use?
  - There is no "right answer"
  - Depends on your project needs.
  - _Give tips on choosing the right one.._

### End card

- How to reach me
- Social media
- Website
- Ask questions

## Ideas

- Make app that can demonstrate all three SM patterns. 
- Make the entire presentation interactive by building it in Flutter (in addition to a backup Keynote presentation).