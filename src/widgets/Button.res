@react.component
let make = (~onClick, ~children) =>
  <button className="bg-blue-500 hover:bg-blue-700 text-white rounded p-1" onClick>
    children
  </button>
