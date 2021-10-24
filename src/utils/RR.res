include React

let s = string

let useStateValue = initial => useReducer((_ignored, newState) => newState, initial)
