// Note: This widget is not very type safe

type props<'a> = {
  label: option<string>,
  value: option<'a>,
}

@get external getProps: React.element => props<'a> = "props"

module Item = {
  @react.component
  let make = (~label: string, ~value as _: 'a, ~onClick: option<unit => unit>=?) =>
    <option onClick={_ => onClick->Belt.Option.forEach(onClick => onClick())}>
      {label->RR.s}
    </option>
}

@react.component
let make = (~value: 'a, ~isEqual: ('a, 'a) => bool, ~onChange: 'a => unit, ~children) => {
  <select>
    {children->React.Children.map(elem => {
      let props = elem->getProps
      React.cloneElement(
        elem,
        {
          "onClick": () =>
            switch props.value {
            | Some(itemValue) if !isEqual(itemValue, value) => onChange(itemValue)
            | None | Some(_) => ()
            },
        },
      )
    })}
  </select>
}
