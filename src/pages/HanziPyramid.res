let getRandomHanzi = count =>
  Array.makeBy(count, _i =>
    Js.Math.random_int(0x4e00, 0x9fff + 1)->Js.String2.fromCharCode
  )->Array.joinWith("")

let getHanziLines = count => Array.makeBy(count, i => getRandomHanzi(i + 1))

@react.component
let make = () => {
  let initCount = 8
  let (count, setCount) = RR.useState(() => initCount->string_of_int)
  let (lines, setLines) = RR.useState(() => getHanziLines(initCount))

  let generate = () =>
    setLines(_ => count->int_of_string_opt->Option.getWithDefault(1)->getHanziLines)

  React.useEffect1(() => {
    generate()
    None
  }, [count])

  <div className="flex flex-col items-center space-y-4">
    <h1 className="text-4xl"> {"Hanzi pyramid"->RR.s} </h1>
    <div className="space-x-2">
      <input
        className="w-12"
        autoFocus=true
        type_="number"
        value={count}
        onChange={evt => setCount(_ => ReactEvent.Form.target(evt)["value"])}
        onKeyPress={evt =>
          if ReactEvent.Keyboard.key(evt) == "Enter" {
            generate()
          }}
      />
      <Button onClick={_ => generate()}> {"Generate"->RR.s} </Button>
    </div>
    <div className="text-center">
      {lines
      ->Array.mapWithIndex((i, line) =>
        <p key={i->string_of_int} className="text-3xl"> {line->RR.s} </p>
      )
      ->RR.array}
    </div>
  </div>
}
