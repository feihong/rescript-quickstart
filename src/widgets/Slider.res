let fs = Js.Float.toString

@react.component
let make = (~value, ~min, ~max, ~step, ~onChange: float => unit) =>
  <input
    type_="range"
    value={value->fs}
    min={min->fs}
    max={max->fs}
    step
    onChange={evt =>
      ReactEvent.Form.currentTarget(evt)["value"]->float_of_string_opt->Option.forEach(onChange)}
  />
