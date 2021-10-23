/*
  Note: This widget only works if labels are unique. Chrome on Linux doesn't register click events on option elements so
  that strategy doesn't work.
*/

type props<'a> = {
  label: option<string>,
  value: option<'a>,
}

@get external getProps: React.element => props<'a> = "props"

module Item = {
  @react.component
  let make = (~label: string, ~value as _: 'a) => <option value=label> {label->RR.s} </option>
}

@react.component
let make = (~value: 'a, ~isEqual: ('a, 'a) => bool, ~onChange: 'a => unit, ~children) => {
  let items = children->React.Children.toArray->Array.map(getProps)
  let label =
    items
    ->Array.getBy(item =>
      switch item.value {
      | Some(value') => isEqual(value', value)
      | None => false
      }
    )
    ->Option.flatMap(item => item.label)

  let onChangeForLabel = label => {
    let break = ref(false)
    let i = ref(0)

    while !break.contents && i.contents < items->Array.length {
      let item = items->Array.getExn(i.contents)
      switch (item.label, item.value) {
      | (Some(label'), Some(value')) if String.equal(label', label) && !isEqual(value', value) =>
        onChange(value')
        break := true
      | (_, _) => ()
      }
      i := i.contents + 1
    }
  }

  <select
    value=?label
    onChange={evt => {
      let label = ReactEvent.Form.target(evt)["value"]
      onChangeForLabel(label)
    }}>
    {children}
  </select>
}
